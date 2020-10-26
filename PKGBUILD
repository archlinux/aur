# Maintainer: Joe Holden <jwh@zorins.us>
_pkgbase=mautrix-whatsapp
pkgname=mautrix-whatsapp-git
pkgver=r451.cccaa62
pkgrel=1
pkgdesc="A Matrix-WhatsApp puppeting bridge (git)"
arch=('x86_64')
license=('AGPL')
depends=(libolm ffmpeg)
makedepends=(go libolm)
conflicts=(mautrix-whatsapp)
source=("${_pkgbase}::git+https://github.com/tulir/${_pkgbase}"
        sysusers-mautrix-whatsapp.conf
        mautrix-whatsapp.tmpfiles
        mautrix-whatsapp.service
        log-path.diff)
backup=("etc/${_pkgbase}/mautrix-whatsapp.yaml")
md5sums=('SKIP'
         'f1fea8f4fcd101f1230031652de1c53c'
         '6e1e73d152d8a459541fcb6c79654c4a'
         '01bd1d42f312bebfeec6f8a71e714d1d'
         '9b4a4e7d6265ecc83cdaa83a03f1bd5b')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  patch -Np1 < "$srcdir/log-path.diff"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "$srcdir/$_pkgbase"
  install -Dm755 "$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"

  install -Dm644 "$srcdir/sysusers-mautrix-whatsapp.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-whatsapp.conf"
  install -Dm644 "$srcdir/mautrix-whatsapp.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-whatsapp.conf"

  install -Dm600 "example-config.yaml" "$pkgdir/etc/$_pkgbase/mautrix-whatsapp.yaml"
  install -Dm644 "$srcdir/mautrix-whatsapp.service" "$pkgdir/usr/lib/systemd/system/mautrix-whatsapp.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
