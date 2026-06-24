# Maintainer: fuero <fuerob@gmail.com>
pkgname=sshpiper
_sshpiper_commit=c785453d857dbf33dd9431a50ced4c11694c6e92
# renovate: datasource=github-releases depName=tg123/sshpiper
pkgver=1.5.4
pkgrel=2
pkgdesc='reverse proxy for ssh scp'
arch=('x86_64' 'aarch64')
url='https://github.com/tg123/sshpiper'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'npm')
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "sshpiper.crypto-${_sshpiper_commit}.tar.gz::https://github.com/tg123/sshpiper.crypto/archive/${_sshpiper_commit}.tar.gz"
  sshpiperd.service
  sshpiperd.default
  sshpiperd-webadmin.service
  sshpiperd-webadmin.default
)
sha512sums=('6e3d582554f0c2bec934ceabb4574196284cabcf0c851cdcd20640c9b63345d4003c006fd0df79ecdb8a55fb908a24bfe882d89b8a4f729b5d5abbf5ce7d37c3'
            'b676ec81507f974e736b73b1df77322367b23e46732f6dc60cd3feeca26d0392aaf900ed9fae6f75baa46acd03aa47544a54947930b0350ac45e555fff342438'
            'c1fe0bc4840d1f02afd60a8ee53429c4b62a0f46b5bfdb8d5d12686e6f08b4279563e69b33c9b93163a5fab3e76bd0aa17aba08cd238ff683b68f15c7bc7a825'
            'f689b5624f70fe8f67a8c396e7a53cc2b4bfd2d8e9beabad57f99be25639678968915aaf3e08fd801ad614f67243132fb5f928a5aa7b3e9ad20a13bb403bfb5c'
            'cde059e9f598f2598dcccc1fa02fa3cacafa962e8cd69a12e034a686461efe323fdc9d4f45aa51d2986080d8d3ad4a20c227c3ea04a91fedf3f5757905aca214'
            '6ba05c3f052f0b9f51573244fa3c8c606edc3595b51b098c21f55aa0c012fae55eb03af07f166678028bbea2e24e579a411420f08e5ccd659550cbfea3e58423')
b2sums=('be54ceae82c5a8ab1c73f583342db89778686d169b2948359d280059e0ffbea997b62decf14f09d0e7c99b5ccc9f4da25953a619ff0e4469de84754e505bc5b3'
        '66c830585f8a85b2ac2520b74f97f537aa4c5565b6f197a4f1144c08ec22cee9b619721e34a9b5fa918857145748df2531b512975550386f0c195584f1b01384'
        '1c133961cd04a38142c62e29fe25037b2169549f6aab93815f743d8d885c4416d461183574207885ac698375da3f6486f2a87bb5aabad375b05291f123190267'
        '42ed254a54a849e3e6527d506da9ecf924572358ebdcb4c27a7dad925a2644a51922f12d684dd9ef1914aeff412b9eefb5432d8ca65f54920c8fd9e2effeaabc'
        'b1cbbd0d6c5adc64430cda844463e956429221407bc3a99d196c1b43f59cb219bc321a701e007c16da67f69c7207f605e06109a912aa5ef36672ba1a461d693d'
        '356ccc0dc49c448160e0e083cd9b02763273193bad6c4f8f039d9bcb89ad5c78cd5eb27cd5882ab1c04804a8b7308caa26eb347a4c95a7edc8d64d198e403408')

prepare() {
  cd "${pkgname}-${pkgver}"
  tar xf "${srcdir}/sshpiper.crypto-${_sshpiper_commit}.tar.gz"
  rm -rf crypto
  ln -snf "sshpiper.crypto-${_sshpiper_commit}" crypto
}

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    main.mainver="v${pkgver}"
    version="v${pkgver}"
    commit="${_commit:?}"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"

  npm --prefix cmd/sshpiperd-webadmin/internal/httpapi/web ci
  npm --prefix cmd/sshpiperd-webadmin/internal/httpapi/web run build
  go build -v \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode external" \
    -tags full \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  for i in bin/sshpiperd*
  do
    install -Dm755 "${i}" "${pkgdir}/usr/bin/${i/bin\//}"
    rm -f "${i}"
  done
  for i in bin/*
  do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/sshpiper/${i/bin\//}"
  done

  install -Dpm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dpm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dpm644 ${srcdir}/sshpiperd{,-webadmin}.service -t "${pkgdir}/usr/lib/systemd/system"
  for i in ${srcdir}/sshpiperd{,-webadmin}.default
  do
    install -Dpm0644 "${i}" "${pkgdir}/etc/default/$(basename ${i/.default})"
  done
}
