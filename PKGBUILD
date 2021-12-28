# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=immudb
pkgver=1.2.1
pkgrel=2
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
            '914ff4dc617b0e64bf8c98f87a56522d741305c251d798ea9dbaa5a081dbcebe8e1b97584ee60915ef29657c6a5fcf28d61456a16167ae5bb652e699b4a77c8f'
            '6368c07fbf02025c207ab7909e4483d274d369e48b69a8062e86b9db9758f21da74131e1dd74a44bf6c778e0a2880ed25039c5c01b1cc52bbe6a6065edca245a'
            '8679bde00795504a344663f0bcbd32c452604727ab53131b97c2c8bdf03638e115b02cc944402f32dbc6432d050aa764f6efab1ae85b97e4ef8c6770e76b06f8'
            '5a8156ca7a5fa84975acf23fa222715b9c61d17325c56b00983b79922d1a63124a36e41880797bfb774903b0b3c8877e087b3231564f9bd79ad43ab5fd26187d')
b2sums=('SKIP'
        '7a0b07c3992f8f45d08e39ec733c857773c5c99db3d8efa1731e291bea0810954e0750d4ceef5c7126039f22c594967fbea40d2363a90a415e42f12a4ebf733c'
        'e1cc430a9d31094f4c3049a70d2861875e2a5917e8b446d7622253b07f4b34dece991f9bd03ddbaa45ba31a75183f8cb3067b75d2f8a59cbadfadd2233c41c30'
        '01777a70ae86d89eafbadae4487bcac03357d1ea9bc76d8de0b5560d43c82d351fe22bdf34a74b7d014abc94057ed38f3dd9e21961645562172e225705ed90f9'
        'f0bb661fbeae5b58b56b5ba2c4c99f2517521ff7ee90b0b6108fe588940d4a0434ad1ad1552ad16442b1e4c8ba3d33b5d1c5c133d273140afd9c19849f53f2fa'
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

  # build binary
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/codenotary/immudb/cmd/version.Version=${pkgver} \
    -X github.com/codenotary/immudb/cmd/version.Commit=${_commit} \
    -X github.com/codenotary/immudb/cmd/version.BuiltBy=someone@builder \
    -X github.com/codenotary/immudb/cmd/version.BuiltAt=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o output \
    -tags webconsole \
    ./cmd/{immudb,immuclient,immuadmin}

  # create completion
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

  # man page
  install -vDm644 tools/packaging/deb/man/immu{client,db}.1 -t "$pkgdir/usr/share/man/man1"

  # systemd integration
  install -vDm644 ../systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 ../sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 ../tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # configuration
  install -vDm644 ../config.toml "$pkgdir/etc/$pkgname/$pkgname.toml"
}
