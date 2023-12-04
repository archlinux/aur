# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

pkgname=photoprism
pkgver="231128"
commit="f48ff16ef"
pkgrel=0
epoch=
pkgdesc="Personal Photo Management powered by Go and Google TensorFlow "
arch=(x86_64 aarch64)
url="https://github.com/photoprism/photoprism"
license=('GPLv3')
groups=()
depends=(tensorflow115 icu)
makedepends=(go nodejs npm git)
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
source=("git+https://github.com/photoprism/photoprism.git#tag=${pkgver}-${commit}" # "git+https://github.com/photoprism/photoprism.git#commit=$commit"
        "https://dl.photoprism.org/tensorflow/nasnet.zip"
        "https://dl.photoprism.org/tensorflow/facenet.zip"
        "https://dl.photoprism.org/tensorflow/nsfw.zip"
        "photoprism.service"
        "photoprism.sysusers"
        "defaults.yml"
        "photoprism.tmpfiles"
        "photoprism-import.service"
        "photoprism-import.timer")
sha256sums=('SKIP'
            'a0e1ad8d5a5a0ff9efc4b3ed89898bf008563ee36cacd0c804a384f8fc661588'
            'bf9ae0945d2ac53ac3db27082162d2b9dda5ba2c564c0e4c4f539f31f8b670af'
            'eb5e5d22e37961c3192a4757efff883f77bc989c0efceabb1395e0959d966f14'
            '18fb59d0ee09f6b9d95666e8c6fdd1b151fae985c18befb11b86e0fc1884b7d7'
            '73afd3b2983d6a31405c5a68f553f1a82a87a0d38483cdb56e32e959840ad1a6'
            'f1242a6208a2623815d585d089fa133664dc3ddf5f63b468093da059141fb523'
            'ec6f438c9818f982fb2aaa1895a8b07abb41a3c2befd1c3baa2fecbc2d6cc721'
            '76de44acbdfd3f818b9549b77daf187fb740ceccd3c01d42d8308d5edcf49d6c'
            'ca4bfbddf0a550f215f28e31de56eb9ac60777f65aa7b89433155aa7998388e8')
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname"
	DOCKER_ARCH=$CARCH GO_BIN=/usr/bin/go scripts/build.sh prod ./photoprism

	cd "frontend";
	npm install
	NODE_ENV=production npm run build
}

check() {
	"$pkgname/photoprism" --version
}

package() {
	install -Dm 0644 "${srcdir}/photoprism.service" "${pkgdir}/usr/lib/systemd/system/photoprism.service"
	install -Dm 0644 "${srcdir}/photoprism-import.service" "${pkgdir}/usr/lib/systemd/system/photoprism-import.service"
	install -Dm 0644 "${srcdir}/photoprism-import.timer" "${pkgdir}/usr/lib/systemd/system/photoprism-import.timer"
	install -Dm 0644 "${srcdir}/photoprism.sysusers" "${pkgdir}/usr/lib/sysusers.d/photoprism.conf"
	install -Dm 0644 "${srcdir}/photoprism.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/photoprism.conf"

	mkdir -p "$pkgdir/etc/photoprism"
	install -Dm 0444 "${srcdir}/defaults.yml" "$pkgdir/etc/photoprism/defaults.yml"

	mkdir -p "$pkgdir/var/lib/photoprism/assets/"

	cp -r "${srcdir}/nasnet" "${srcdir}/facenet" "${srcdir}/nsfw" "$pkgdir/var/lib/photoprism/assets/"

	cd "$pkgname"

	install -Dm 0755 ./photoprism "$pkgdir/usr/bin/photoprism"
	cp -r assets/locales assets/profiles assets/static assets/templates "$pkgdir/var/lib/photoprism/assets/"

	find "$pkgdir/var/lib/photoprism/assets/" -type d -exec chmod +x {} \;
}
