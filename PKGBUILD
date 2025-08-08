# Maintainer:  shtrophic <aur@shtrophic.net>
# Contributor: Evine Deng <evinedeng@hotmail.com>
# Contributor: Thomas Eizinger <thomas@eizinger.io>

pkgname=photoprism
pkgver=250707
_commit=d28b3101e
_pkgver="${pkgver}-${_commit}"
pkgrel=2
pkgdesc="AI-Powered Photos App for the Decentralized Web"
arch=('x86_64' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
license=('AGPL-3.0-or-later')
depends=(glibc glib2 libvips tensorflow)
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
        "https://dl.${pkgname}.app/tensorflow/facenet.zip"
        "https://dl.${pkgname}.app/tensorflow/nasnet.zip"
        "https://dl.${pkgname}.app/tensorflow/nsfw.zip"
        "${pkgname}-import.service"
        "${pkgname}-import.timer"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service"
        "defaults.yml")
backup=("etc/${pkgname}/defaults.yml")
conflicts=('photoprism-facenet' 'photoprism-nasnet' 'photoprism-nsfw')
replaces=('photoprism-facenet' 'photoprism-nasnet' 'photoprism-nsfw')
b2sums=('42fdb6d35c43f4863faf30bfa2ab6a9005e7534544070565b152ec61ebed356e05c093058f3939043fb7dbcf36e187978edb67c3b70195cdce6b314d73c54d09'
        'ae3fe8162773ca9c84be2ea49dbc33e8a381d25cbbb51660c9f7a0764b89128eb8b40aceb10272e2579f277f76b8622d1f366e38e7c290266280c1db268365c5'
        '846cc4ce2d8c170c6442cf1f3a235d49744ff704300b619947bd425861ac4312d5465c749fd1179e4c25163d3a3428cd31359b7ea1521fa6edab81dba88074a0'
        'ca264c8ba2f999490c1335767286ddfe42a92d8606c371f17b5aa3f333bda3ade9c4f2451f7df7489946c9ae503f82351879a9876cd80e036a7991945e1242ec'
        'f5a06fd26f15afa7b71bd66afba800488fad697567754b6efc0d20f55955c043ba817d280b1d80c901ccbfcf085f11ad289624946bcd4bf2c3f3ee963a431c2d'
        'e75033ee265dddf39cb4f0d1cfc1e86a540da37c9787e3c13040b6fc039437d6684be3b59d63f001864f98f46afd49847b86b4fc6bedf891be87881a4bb83cf0'
        '3896b95ddda233270591e673f564bb3c7c537f9140d9ad0451259249d0bd956daf2b2cc70c3ba7fbd2971e97e126e13ecde368388c8e160708fbccad206c5d55'
        '02a752c8dda9c1611cac8119cf603bb8147dda1aa68fabaa9be61952e1839132d190691a68a01d0443d3750f76319a9e77e7fb9f175d5dbd0f527e5e4529ede8'
        'f8ad9373b97b6f5bda10caa193ae3f6700f8e15d82f30a2c8ad0fec02c5c25c3ad1f62ae524aa5e28b07312016d31c2918a3a9a3b172e61128fe054b129eecbe'
        '96d8d89499adfd1e3fba1b729133f3a01dbe16b2cb11deacc7e0e69620530c8f28e19911b16368816d98ce8e4ffa9645e8cb0429c82314179c335e736db87198'
        '06fdb8f5e449dc04ace43da24a3d8d2d8c6f2b0fde47c4aaee354e5bf9d729ae0ac31e6366d115161a9fdb75d3ddf9982654cbb491972d80892a355b69741693')

prepare() {
    export GOPATH="$srcdir/go"
    export GOFLAGS="-modcacherw -mod=readonly"

    cd "$pkgname-$_pkgver"
    go mod download
    npm --prefix=frontend install --cache "$srcdir/npm-cache"
}

build() {
    export CGO_CFLAGS="$CFLAGS -I/usr/include/tensorflow"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export NODE_ENV=production
    export GOPATH="$srcdir/go"

    cd "$pkgname-$_pkgver"
    local buildid="$_pkgver-$(uname -s)-$(uname -m)"
    local ldflags="
	-s -w \
	-linkmode external \
	-extldflags '$LDFLAGS' \
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
    find {facenet,nasnet,nsfw} -type f -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/"{} \;

    install -Dm644 "$pkgname-import".* 	     -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$pkgname.service"      	"$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname.sysusers"     	"$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$pkgname.tmpfiles"     	"$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 "$pkgname.user.service" 	"$pkgdir/usr/lib/systemd/user/$pkgname.service"
    install -Dm644 "defaults.yml"            	"$pkgdir/etc/$pkgname/defaults.yml"

    cd "$pkgname-$_pkgver"
    install -Dm755 "$pkgname"              	"$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE		     -t "$pkgdir/usr/share/licenses/$pkgname"

    cd assets
    find {locales,profiles,static,templates} -type f -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/"{} \;
}
