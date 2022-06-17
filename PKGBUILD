# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

pkgname=photoprism
pkgver="220617"
commit="0402b8d3"
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
optdepends=()
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
        "options.yml"
        "photoprism.tmpfiles")
sha256sums=('SKIP'
            'a0e1ad8d5a5a0ff9efc4b3ed89898bf008563ee36cacd0c804a384f8fc661588'
            'bf9ae0945d2ac53ac3db27082162d2b9dda5ba2c564c0e4c4f539f31f8b670af'
            'eb5e5d22e37961c3192a4757efff883f77bc989c0efceabb1395e0959d966f14'
            '54bd008dc089cb29a1bef22a2509bbf493af387104725193595b67d82c5e2b9d'
            '73afd3b2983d6a31405c5a68f553f1a82a87a0d38483cdb56e32e959840ad1a6'
            '3921b7516182b82a41672b3894ff998ce78b19d39c87b76a8db2894b01145287'
            'ec6f438c9818f982fb2aaa1895a8b07abb41a3c2befd1c3baa2fecbc2d6cc721')
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
	install -Dm 0644 "${srcdir}/photoprism.sysusers" "${pkgdir}/usr/lib/sysusers.d/photoprism.conf"
	install -Dm 0644 "${srcdir}/photoprism.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/photoprism.conf"

	mkdir -p "$pkgdir/etc/photoprism"
	install -Dm 0444 "${srcdir}/options.yml" "$pkgdir/etc/photoprism/options.yml"

	mkdir -p "$pkgdir/var/lib/photoprism/assets/"

	cp -r "${srcdir}/nasnet" "${srcdir}/facenet" "${srcdir}/nsfw" "$pkgdir/var/lib/photoprism/assets/"

	cd "$pkgname"

	install -Dm 0755 ./photoprism "$pkgdir/usr/bin/photoprism"
	cp -r assets/locales assets/profiles assets/static assets/templates "$pkgdir/var/lib/photoprism/assets/"

	find "$pkgdir/var/lib/photoprism/assets/" -type d -exec chmod +x {} \;
}
