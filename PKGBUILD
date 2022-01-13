# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

pkgname=photoprism
pkgver="220107"
commit="f5b7ef83"
pkgrel=0
epoch=
pkgdesc="Personal Photo Management powered by Go and Google TensorFlow "
arch=(x86_64 aarch64)
url="https://github.com/photoprism/photoprism"
license=('GPLv3')
groups=()
depends=(tensorflow115)
makedepends=(go nodejs npm)
checkdepends=()
optdepends=()
provides=("photoprism")
conflicts=("photoprism")
replaces=()
backup=("etc/photoprism/options.yml")
options=()
install=
changelog=
source=("https://github.com/photoprism/photoprism/archive/$pkgver-$commit.tar.gz" "https://dl.photoprism.org/tensorflow/nasnet.zip" "https://dl.photoprism.org/tensorflow/facenet.zip" "https://dl.photoprism.org/tensorflow/nsfw.zip" "photoprism.service" "photoprism.sysusers" "options.yml" "photoprism.tmpfiles")
sha256sums=('d92064f73ad98c4038e72d4c6b9999473d0c68da4e4ed58a53dfcd553b433b1a'
            'a0e1ad8d5a5a0ff9efc4b3ed89898bf008563ee36cacd0c804a384f8fc661588'
            'bf9ae0945d2ac53ac3db27082162d2b9dda5ba2c564c0e4c4f539f31f8b670af'
            'eb5e5d22e37961c3192a4757efff883f77bc989c0efceabb1395e0959d966f14'
            'ffdd71f969b5a80ad0d3bf3a1cd5b90860cac838b22f1cf5453bbff790180dfa'
            '73afd3b2983d6a31405c5a68f553f1a82a87a0d38483cdb56e32e959840ad1a6'
            '3921b7516182b82a41672b3894ff998ce78b19d39c87b76a8db2894b01145287'
            'ec6f438c9818f982fb2aaa1895a8b07abb41a3c2befd1c3baa2fecbc2d6cc721')
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname"-"$pkgver"-"$commit"
	scripts/build.sh prod ./photoprism

	cd "frontend";
	npm install
	NODE_ENV=production npm run build
}

check() {
	"$pkgname"-"$pkgver"-"$commit/photoprism" --version
}

package() {
	install -Dm 0644 "${srcdir}/photoprism.service" "${pkgdir}/usr/lib/systemd/system/photoprism.service"
	install -Dm 0644 "${srcdir}/photoprism.sysusers" "${pkgdir}/usr/lib/sysusers.d/photoprism.conf"
	install -Dm 0644 "${srcdir}/photoprism.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/photoprism.conf"

	mkdir -p "$pkgdir/etc/photoprism"
	install -Dm 0444 "${srcdir}/options.yml" "$pkgdir/etc/photoprism/options.yml"

	mkdir -p "$pkgdir/var/lib/photoprism/assets/"

	cp -r "${srcdir}/nasnet" "${srcdir}/facenet" "${srcdir}/nsfw" "$pkgdir/var/lib/photoprism/assets/"

	cd "$pkgname"-"$pkgver"-"$commit"

	install -Dm 0755 ./photoprism "$pkgdir/usr/bin/photoprism"
	cp -r assets/locales assets/profiles assets/static assets/templates "$pkgdir/var/lib/photoprism/assets/"

	find "$pkgdir/var/lib/photoprism/assets/" -type d -exec chmod +x {} \;
}
