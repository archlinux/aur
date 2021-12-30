# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=immudb
pkgver=1.2.1
pkgrel=3
pkgdesc="Immutable database built on a zero-trust model"
arch=('x86_64')
url="https://codenotary.com/technologies/immudb/"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/immudb/immudb.toml')
options=('!lto')
_commit='1585f5ec5165b3e601cbf7533ce5f6143633b7c2'
_wcver=1.0.14 # extracted from Makefile variable: DEFAULT_WEBCONSOLE_VERSION
source=(
  "$pkgname::git+https://github.com/codenotary/immudb.git#commit=$_commit"
  "$pkgname-webconsole-$_wcver.tar.gz::https://github.com/codenotary/immudb-webconsole/releases/download/v${_wcver}/immudb-webconsole.tar.gz"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
  'config.toml'
)
noextract=("$pkgname-webconsole-$_wcver.tar.gz")
sha512sums=('SKIP'
            '7c9a218aeaa91edd7a5283f8c09838f3eeca49b9fe358365c29245b3b0ce447748c9aad96dc695cad943e7171e3435a8f869dac050273993dc06bd584eb3b945'
            'c95d9df140d239946e29551c63383b83e2e052f91924162876e61f8fd51560556bbe118ff1c264bfe2f7e972e231b79546b78d93e0f7a039b507fc85a13a5035'
            '6368c07fbf02025c207ab7909e4483d274d369e48b69a8062e86b9db9758f21da74131e1dd74a44bf6c778e0a2880ed25039c5c01b1cc52bbe6a6065edca245a'
            '54b4f53c902f4c77000973879881092e62e673bac7149cd77e33172eae1a46b3cf69c07001cc41858d962929213fe48f3185009f664a155e72a830591de3d69f'
            '5a8156ca7a5fa84975acf23fa222715b9c61d17325c56b00983b79922d1a63124a36e41880797bfb774903b0b3c8877e087b3231564f9bd79ad43ab5fd26187d')
b2sums=('SKIP'
        '7a0b07c3992f8f45d08e39ec733c857773c5c99db3d8efa1731e291bea0810954e0750d4ceef5c7126039f22c594967fbea40d2363a90a415e42f12a4ebf733c'
        '6a7931e877cefe21b98fe1e0a8bc1a77bbe7bd386347e3a416a189e4a3831d19aaa7ea97cb34f37e0c442eb18758f9427694113d4b10a713e308485ec7cd0de0'
        '01777a70ae86d89eafbadae4487bcac03357d1ea9bc76d8de0b5560d43c82d351fe22bdf34a74b7d014abc94057ed38f3dd9e21961645562172e225705ed90f9'
        '29b41df6c374dc6beebd9622760b94b0ce95c1261f0121ce13eee614aa0a53eaa8c8029a087d339f2bdf6a4a6d955a0df9c50bdc0900bca29256e5f0b2bb71e5'
        'fe3cbf75d72500c0809f3a47c959429e008d648d4298ad53e870be194a4ebe9173805b4c634bc1e5e53a00a350f794afbd0b8ae869d05cff487a9a627891431d')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  # extract web console
  bsdtar \
    --extract \
    --file "$pkgname-webconsole-$_wcver.tar.gz" \
    --directory "$pkgname/webconsole"

  cd "$pkgname"

  # create directory for build output
  mkdir -p output/{bash,fish,zsh}

  # create systemd service with correct link to documentation
  sed "s/@@PKGVER@@/$pkgver/" ../systemd.service > output/systemd.service

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # generate web console
  go generate -tags webconsole ./webconsole

  # build binaries
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/codenotary/immudb/cmd/version.Version=${pkgver} \
    -X github.com/codenotary/immudb/cmd/version.Commit=${_commit} \
    -X github.com/codenotary/immudb/cmd/version.BuiltBy=makepkg \
    -X github.com/codenotary/immudb/cmd/version.BuiltAt=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o output \
    -tags webconsole \
    ./cmd/{immudb,immuclient,immuadmin}

  # create shell completion scripts
  for client in immudb immuclient immuadmin; do
    for shell in bash fish zsh; do
      "./output/$client" completion "$shell" > "output/$shell/$client"
    done
  done
}

package() {
  cd "$pkgname"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" output/{immudb,immuclient,immuadmin}

  # shell completion - bash
  install -vDm644 output/bash/* -t "$pkgdir/usr/share/bash-completion/completions"

  # shell completion - fish
  for completion in immudb immuclient immuadmin; do
    install -vDm644 "output/fish/$completion" "$pkgdir/usr/share/fish/vendor_completions.d/$completion.fish"
  done

  # shell completion - zsh
  for completion in immudb immuclient immuadmin; do
    install -vDm644 "output/zsh/$completion" "$pkgdir/usr/share/zsh/site-functions/_$completion"
  done

  # man pages
  install -vDm644 tools/packaging/deb/man/immu{client,db}.1 -t "$pkgdir/usr/share/man/man1"

  # systemd integration
  install -vDm644 output/systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 ../sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 ../tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # configuration
  install -vDm644 ../config.toml "$pkgdir/etc/$pkgname/$pkgname.toml"
}
