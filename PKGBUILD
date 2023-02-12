pkgname='webvirtd-git'
pkgver=1.0.1.r3.g1d9c9bd
pkgrel=1
pkgdesc='A libvirt JSON API'
groups=('webvirt-git')
license=('Apache')
url='https://github.com/kevr/webvirtd'

arch=('i686' 'x86_64')
makedepends=('meson' 'ninja' 'libvirt' 'boost-libs')
depends=('libvirt' 'boost-libs')
provides=('webvirtd')
conflicts=('webvirtd')

source=("${pkgname}::git+https://github.com/kevr/webvirtd")
sha256sums=('SKIP')

install='webvirtd.install'

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  DESTDIR="$pkgdir" meson setup \
    --buildtype release \
    -Ddisable_tests=true \
    -Dprefix=/usr \
    build
}

package()
{
  mkdir -p "$pkgdir"/usr/lib/{sysusers,tmpfiles}.d
  echo 'g webvirt - -' > "$pkgdir/usr/lib/sysusers.d/webvirt.conf"
  echo 'u webvirt /var/lib/webvirt "webvirtd user" /var/lib/webvirt' >> "$pkgdir/usr/lib/sysusers.d/webvirt.conf"
  echo 'm webvirt webvirt' >> "$pkgdir/usr/lib/sysusers.d/webvirt.conf"
  echo 'd /var/lib/webvirt 0755 webvirt webvirt ' > "$pkgdir/usr/lib/tmpfiles.d/webvirt.conf"

  cd "$pkgname"/build
  ninja -j$(nproc)
  DESTDIR="$pkgdir" meson install --skip-subprojects
}
