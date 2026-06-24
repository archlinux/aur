# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='dc5712e3acf168512f4d81e5306b4769afce3aa1'
pkgname=alps
pkgver=2026.06.19
pkgrel=1
pkgdesc='A simple and extensible webmail'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://git.sr.ht/~migadu/alps'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
backup=("etc/${pkgname}.toml")
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~migadu/${pkgname}/archive/${_commit}.tar.gz"
        "${pkgname}-system.service"
        "${pkgname}-user.service"
        "${pkgname}-plugins-path.patch")
b2sums=('de2090cae40ae7144ed6fd423e4edfea352b780166ea4e252f2344bd4e197dfabc364d0b42f91ecafdc980ec83c9588288766fa018d0237f5593b255a68e4712'
        'f8a965be3570f8094d76b8d4617d8d985cd6f6eef76ac35f8b5603d6af39f5e326afb51d507cd5b459d80ca20154df4fe1bb4aba18a7004bda1e0f6bccb719d5'
        'f8b109b613bac65e8c707c94c2bd6e259e13cfb9e833c401a8546a0cb4507b9dc9a8d89091c3793ce602a280e22f5ae3dd66accf589710aaab388aa4546d0ff5'
        '3560f4d24a8aff7e2b7b1c225e3df47b922ba370b7c1f492a5a41f28338860dbaa87a4c81ce8aebb90ae76da8702b5eee919083b4e05c571fab2521fc6aa6477')

prepare(){
  patch -d "${pkgname}-${_commit}" -p1 <"${pkgname}-plugins-path".patch
}

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ${pkgname} ./cmd/alps
}

package() {
  # services
  install -D -m644 ${pkgname}-system.service \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 ${pkgname}-user.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  cd "${pkgname}-${_commit}"
  # binary
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  # plugin assets
  install -d -m755 "${pkgdir}/usr/lib/${pkgname}/plugins"
  for plugin in plugins/*; do
    [ -d "${plugin}/public" ] && \
      install -d -m755 "${pkgdir}/usr/lib/${pkgname}/${plugin}" && \
      cp -a "${plugin}/public" \
        "${pkgdir}/usr/lib/${pkgname}/${plugin}"
  done
  # config
  install -D -m644 config.example.toml "${pkgdir}/etc/${pkgname}.toml"
  # docs
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"
  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
