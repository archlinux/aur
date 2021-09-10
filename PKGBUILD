# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=systemd-libs-fake-bin
pkgver=249.4
pkgrel=2
pkgdesc="Fake systemd client libraries without libudev - real binaries"
arch=('x86_64')
url="https://www.github.com/systemd/systemd"
license=('LGPL2.1')
depends=('glibc' 'libcap' 'libgcrypt' 'libp11-kit' 'lz4' 'xz' 'zstd')
makedepends=('arch-package-download')
provides=('systemd-libs-fake' 'systemd-libs' 'libsystemd' 'libsystemd.so')
conflicts=('systemd-libs-fake' 'systemd-libs' 'libsystemd')

package() {
	rm -rf systemd*
	for i in systemd systemd-libs; do
		mkdir "$i"
		arch-package-download "$i"
		tar xf "$i"-*.tar.zst -C "$i"
	done

	lib="$(cd systemd && echo "usr/lib/systemd/libsystemd-shared-"*.so)"
	install -Dm755 "systemd/$lib" "$pkgdir/$lib"

	for i in systemd-libs/usr/lib/*; do
		case "$i" in */libudev*) continue ;; esac
		cp -P "$i" "$pkgdir/usr/lib/"
	done
}
