# Maintainer:  shtrophic <aur@shtrophic.net>
# Contributor: Evine Deng <evinedeng@hotmail.com>
# Contributor: Thomas Eizinger <thomas@eizinger.io>

pkgname=photoprism
pkgver=261007
_commit=65faaae5d
_pkgver="${pkgver}-${_commit}"
pkgrel=1
pkgdesc="AI-Powered Photos App for the Decentralized Web"
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL-3.0-or-later')
depends=(glibc glib2 libvips photoprism-tensorflow photoprism-onnxruntime)
makedepends=(go npm findutils)
optdepends=("darktable: for RAW to JPEG conversion"
	"ffmpeg: for video transcoding and thumbnail extraction"
	"libva: for video transcoding"
	"imagemagick: for image conversion"
	"libheif: for HEIC/HEIF image conversion"
	"mariadb: for MySQL database driver"
	"perl-image-exiftool: for extracting metadata"
	"rawtherapee: for RAW to JPEG conversion")
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
	"https://dl.${pkgname}.app/onnx/models/face_detection_yunet_2026may.onnx"
	"https://dl.${pkgname}.app/onnx/models/face_recognition_sface_2021dec.onnx"
	"https://dl.${pkgname}.app/onnx/models/efficientformerv2_s2.onnx"
	"https://dl.${pkgname}.app/onnx/models/yahoo_open_nsfw.onnx"
	"${pkgname}-import."{service,timer}
	"${pkgname}-vision."{service,timer}
	"${pkgname}."{service,sysusers,tmpfiles,user.service}
	"defaults.yml"
	"01-internal-config-config_go.patch")
backup=("etc/${pkgname}/defaults.yml")
b2sums=('7a4c7f5a3a1cb251aede3cb1104d8972a6316c2172ef7ec817d1276f571cc4d2faf33c89bdc8830ff7744e4c2e67849041403186e81081067da2d93654722cd5'
        '14dc17a3321d41a557a5dc4dc75b69687d89a912b372004b750ce239bef6b3554c74022ddfcd8d737ba10b197f8a5767114edc209ae69f99c38120f1a4707ea5'
        'c52ac4bf680272a9a532249f9d0f26abf9056f88187de829fd85be7010e188c2566cd6ba621a1f7daedc37c1ffca0059fe3b9e58fb570cf7e54836a882371ac1'
        '39a72642ac680f32e85ee99dd9072f6d4c046eb2b84af6ae5381dc25072e8611165174425b0540933dce42497800a591223dd8e655949005f9e0c7dd4d7a35a9'
        '0241c942a703bf712704087e8d2b1abdab9278ea339d331459e671aba5164adefa3decb7a8ceb1dc35865d7d40a0fe44aadbe91379090e7d8797691f5408a213'
        'f5a06fd26f15afa7b71bd66afba800488fad697567754b6efc0d20f55955c043ba817d280b1d80c901ccbfcf085f11ad289624946bcd4bf2c3f3ee963a431c2d'
        'e75033ee265dddf39cb4f0d1cfc1e86a540da37c9787e3c13040b6fc039437d6684be3b59d63f001864f98f46afd49847b86b4fc6bedf891be87881a4bb83cf0'
        '438f6206adaf7b1beccda7b65ea71ecc45c29b4443942b823ad4652dde40d0cdbb8d5b7e3476aaf0643e5ad4369377ae9df0682bf73ca7d2af419c3820b2ef20'
        '8b54d90d8ee721c555c3650f8c1041a5068a65aa847c0f768ce5d05a917b60e961b332fc8608ee7f3b0b8928e0606e49e85b5f3baa1e3b85d00b7decdf9f29da'
        'd910f3cd6f3e28e4f3f529f50b55e7ce3473f1dc51d3a76a91fd0b5c0af68616bd9fee64b574c93b0288302ba82d8a612c065dc4f15bffedd2e5a78b434dfa15'
        '02a752c8dda9c1611cac8119cf603bb8147dda1aa68fabaa9be61952e1839132d190691a68a01d0443d3750f76319a9e77e7fb9f175d5dbd0f527e5e4529ede8'
        'f8ad9373b97b6f5bda10caa193ae3f6700f8e15d82f30a2c8ad0fec02c5c25c3ad1f62ae524aa5e28b07312016d31c2918a3a9a3b172e61128fe054b129eecbe'
        '96d8d89499adfd1e3fba1b729133f3a01dbe16b2cb11deacc7e0e69620530c8f28e19911b16368816d98ce8e4ffa9645e8cb0429c82314179c335e736db87198'
        'eda69ac2d568534e3f5ca89605f68114dc034bc6c31c9a0edbdec14b79165aa9dd2f1183276cde40f0a69cd6e511b2c1250617103dc3d1ee8e0074469be7e93b'
        'e91d9a583d6eb7c2f31f0348885e5f8360c2f442ea800d0afbb627612fd84de2a705eebfa8782d9556b2f8af00fc15d16238e2ecc5700fd9373c693e209c8af8')

prepare() {
	export GOPATH="$srcdir/go"
	export GOFLAGS="-modcacherw -mod=readonly"

	cd "$pkgname-$_pkgver"

	for p in "$srcdir/"*.patch; do
		patch -p0 <$p
	done

	go mod download

	npm --prefix=frontend install --cache "$srcdir/npm-cache"
}

build() {
	export CGO_CFLAGS="$CFLAGS -I/usr/include/photoprism"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export NODE_ENV=production
	export GOPATH="$srcdir/go"

	cd "$pkgname-$_pkgver"
	local buildid="$_pkgver-$(uname -s)-$(uname -m)"
	local ldflags="
	-s -w \
	-linkmode external \
	-extldflags '$LDFLAGS -L/usr/lib/photoprism -Wl,-rpath=/usr/lib/photoprism' \
	-X main.version=$buildid
    "
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "$ldflags" \
		-o "$pkgname" \
		"./cmd/$pkgname/$pkgname.go"

	npm --prefix=frontend run build
}

package() {
	for model in efficientformerv2_s2 yahoo_open_nsfw yunet sface; do
		install -Dm644 *"$model"*.onnx -t "$pkgdir/usr/share/$pkgname/$model"
	done

	install -Dm644 "$pkgname-import".* "$pkgname-vision".* "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$pkgname.user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
	install -Dm644 "defaults.yml" "$pkgdir/etc/$pkgname/defaults.yml"

	cd "$pkgname-$_pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	cd assets
	find {locales,profiles,static,templates} -type f -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/"{} \;
}
