# Maintainer: M0n7y5 <17201053+M0n7y5@users.noreply.github.com>

pkgname=vds-mango
pkgver=0.5.0beta2
pkgrel=1
pkgdesc="Bluetooth DualSense as a virtual USB one: haptics, adaptive triggers, speaker and microphone"
arch=('x86_64')
url="https://github.com/M0n7y5/vds-mango"
license=('MIT')
depends=('bluez' 'dbus' 'glibc' 'hicolor-icon-theme' 'kmod' 'libgcc' 'libstdc++'
         'opus' 'polkit' 'qt6-base' 'qt6-svg' 'systemd-libs')
makedepends=('cmake' 'pkgconf')
optdepends=('pipewire: controller haptics, speaker and microphone'
            'wireplumber: names and priorities of the controller audio devices'
            'logrotate: rotate /var/log/vdsd.log')
conflicts=('vds')
backup=('etc/logrotate.d/vds')
install=vds-mango.install
# pkgver drops the tag's hyphen before the label: 0.5.0beta1 is tag 0.5.0-beta1.
_tag=${pkgver/[[:alpha:]]/-&}
_src=$pkgname-$_tag
source=("$_src.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('82a640fa6b4eb8ba92426161f05504120fd03efd688395bc22b4a3e38c4711b5')

build() {
	cmake -S "$_src" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DINSTALL_SERVICE=OFF \
		-DVDS_VERSION="$_tag"
	cmake --build build
}

package() {
	"$_src/packaging/ArchLinux/stage.sh" \
		"$srcdir/$_src" "$srcdir/build" "$pkgdir"
}
