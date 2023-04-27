# Maintainer: Nixuge

pkgname=reddit-desktop-bin
pkgver=1.0.123
pkgrel=1
pkgdesc='Reddit Desktop is a desktop client for reddit.'
url=https://github.com/sgiurgiu/reddit_desktop
arch=(x86_64)
license=(GNU)
depends=(mpv)
provides=('reddit-desktop')
source=("https://github.com/sgiurgiu/reddit_desktop/releases/download/${pkgver}/reddit_desktop-${pkgver}-debian.deb")
sha256sums=('a9f572a7d6ecd1b5cfae369a27e61274eb9c6a994439c4ad843270f259dc4782')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# The executable really only wants libmpv.so.1 (instead of the libmpv.so.2 provided by MPV)
	# so for now just symlinking it as it still works either way

	# ===== symlink to /usr/lib, dirties the path a bit but works when launching from the terminal
	# (went with that one)
	install -dm755 "${pkgdir}/usr/lib"
	ln -sn /usr/lib/libmpv.so.2 ${pkgdir}/usr/lib/libmpv.so.1

	# ===== symlink to /usr/local/lib, cleaner but only works from the .desktop
	# install -dm755 "${pkgdir}/usr/local/lib"
	# ln -sn /usr/lib/libmpv.so.2 ${pkgdir}/usr/local/lib/libmpv.so.1
	# sed -i 's|Exec=/usr/bin/reddit_desktop|Exec=env LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH /usr/bin/reddit_desktop|g' \
	# 	${pkgdir}/usr/share/applications/reddit-desktop.desktop
}
