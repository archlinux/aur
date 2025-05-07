# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

pkgname=photoprism-bin
pkgver="250426"
_commit="27ec7a128"
pkgrel=0
epoch=
pkgdesc="Personal Photo Management powered by Go and Google TensorFlow "
arch=(x86_64 aarch64)
url="https://github.com/photoprism/photoprism"
license=('AGPL-3.0-only')
groups=()
depends=(icu glib2 glibc gcc-libs libvips tensorflow)
makedepends=()
checkdepends=()
optdepends=("darktable: for RAW to JPEG conversion"
	    "rawtherapee: for RAW to JPEG conversion"
	    "libheif: for HEIC/HEIF image conversion"
	    "ffmpeg: for video transcoding and thumbnail extraction"
	    "perl-image-exiftool: for extracting metadata")
provides=("photoprism")
conflicts=("photoprism")
replaces=()
backup=("etc/photoprism/options.yml")
options=()
install=
changelog=
source_x86_64=("https://github.com/photoprism/photoprism/releases/download/${pkgver}-${_commit}/photoprism_${pkgver}-${_commit}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/photoprism/photoprism/releases/download/${pkgver}-${_commit}/photoprism_${pkgver}-${_commit}-linux-arm64.tar.gz")
source=("photoprism.service"
        "photoprism.sysusers"
        "defaults.yml"
        "photoprism.tmpfiles"
        "photoprism-import.service"
        "photoprism-import.timer")
sha256sums=('18fb59d0ee09f6b9d95666e8c6fdd1b151fae985c18befb11b86e0fc1884b7d7'
            '73afd3b2983d6a31405c5a68f553f1a82a87a0d38483cdb56e32e959840ad1a6'
            'f1242a6208a2623815d585d089fa133664dc3ddf5f63b468093da059141fb523'
            'ec6f438c9818f982fb2aaa1895a8b07abb41a3c2befd1c3baa2fecbc2d6cc721'
            '76de44acbdfd3f818b9549b77daf187fb740ceccd3c01d42d8308d5edcf49d6c'
            'ca4bfbddf0a550f215f28e31de56eb9ac60777f65aa7b89433155aa7998388e8')
sha256sums_x86_64=('8d113bf3ee048e33bb426df4f8125d37dafd480ee51c66a4f67d79714e21c290')
sha256sums_aarch64=('14c9bb7368d6aa56c9c05cb58e6bbdb4fad1616b9f21ff03fc7f147a3e82323e')
noextract=()
validpgpkeys=()

package() {
	install -Dm 0644 "${srcdir}/photoprism.service" "${pkgdir}/usr/lib/systemd/system/photoprism.service"
	install -Dm 0644 "${srcdir}/photoprism-import.service" "${pkgdir}/usr/lib/systemd/system/photoprism-import.service"
	install -Dm 0644 "${srcdir}/photoprism-import.timer" "${pkgdir}/usr/lib/systemd/system/photoprism-import.timer"
	install -Dm 0644 "${srcdir}/photoprism.sysusers" "${pkgdir}/usr/lib/sysusers.d/photoprism.conf"
	install -Dm 0644 "${srcdir}/photoprism.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/photoprism.conf"

	mkdir -p "$pkgdir/etc/photoprism"
	install -Dm 0444 "${srcdir}/defaults.yml" "$pkgdir/etc/photoprism/defaults.yml"

	mkdir -p "$pkgdir/var/lib/photoprism/"

	install -Dm 0755 ./bin/photoprism "$pkgdir/usr/bin/photoprism"
	cp -r ./assets/ "$pkgdir/var/lib/photoprism/"

	find "$pkgdir/var/lib/photoprism/assets/" -type d -exec chmod +x {} \;
}
