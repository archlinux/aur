# Maintainer: gudzpoz <gudzpoz ant live dot com>
# Contributor: Faye Jackson <justalittleepsilon ant gmail dot com>
pkgname=('pleroma-bin')
pkgver=2.4.0
pkgrel=1
pkgdesc='A microblogging server software that can federate (= exchange messages with) other servers that support ActivityPub.'
arch=(x86_64 aarch64 armv7l)
url='https://git.pleroma.social/pleroma/pleroma'
license=('AGPL' 'custom:CC-BY-4.0' 'custom:CC-BY-SA-4.0')
depends=(ncurses file)
makedepends=(coreutils unzip curl)
optdepends=(
    'postgresql: local postgresql database support'
    'imagemagick: Pleroma.Upload.Filters.Mogrify, Pleroma.Upload.Filters.Mogrifun support'
    'ffmpeg: media preview proxy support for videos'
    'perl-image-exiftool: supporting stripping location (GPS) data from uploaded images with Pleroma.Upload.Filters.Exiftool'
)
provides=('pleroma')
backup=('etc/pleroma/config.exs')

# Pipeline #37000
# Merge branch 'release/2.4.0' into 'stable'
_amd64_download="https://git.pleroma.social/pleroma/pleroma/-/jobs/193204/artifacts/download?file_type=archive"
_amd64_checksum="335857f4568c3fa911b7a9a1d5340b0e9ea7fde32f18af2a0cf645081ec0a5df"
_arm_download="https://git.pleroma.social/pleroma/pleroma/-/jobs/193206/artifacts/download?file_type=archive"
_arm_checksum="a757c6a60ad4f11e354323c44f8f576bd5c8219ca4ca99cbd8a5b5706237731f"
_arm64_download="https://git.pleroma.social/pleroma/pleroma/-/jobs/193208/artifacts/download?file_type=archive"
_arm64_checksum="dc3fa4552d43606cc998c9e63963c3c258f15fed002db3aa3f122b9ec378db56"

if [ "$CARCH" = "x86_64" ]
then
	_download_url="$_amd64_download"
	_zip_sum="$_amd64_checksum"
elif [ "$CARCH" = "armv7l" ]
then
	_download_url="$_arm_download"
	_zip_sum="$_arm_checksum";
elif [ "$CARCH" = "aarch64" ]
then
	_download_url="$_arm64_download"
	_zip_sum="$_arm64_checksum"
else
    echo "Unsupported arch: $CARCH"
    exit -1
fi

install=pleroma.install
source=("pleroma.zip::${_download_url}"
        "pleroma.sysusers"
        "pleroma.tmpfiles"
        "pleroma.service"

        "COPYING"
        "AGPL-3"
        "CC-BY-4.0"
        "CC-BY-SA-4.0"
       )
noextract=()
sha256sums=("${_zip_sum}"
            "4df8a0099dada9bf652fb07677a9c6a66cad1f26498f08a55d8acb0186b78979"
            "b5e844fab22dc4fafdec09c1f14437a06d3a12fae753fc0be968d22eaddfd6dc"
            "268952ef036ef65ab146a38ff20bbba35759c0f33510fe6ca15d6765285938ed"

            "e299229268576c559d0155baccccf682c97b51bebab40a0b7ff3ab562ec62104"
            "feff6860d5eab6f5be325078520a79fa6311c73d1e5eeb8b454b90585a0dbfef"
            "9e5f1b3c610b9c2da5c313bf81d577a7d1acec686bdb0384edefa6df0f90cd94"
            "564562d7729efb311556e4b5b9e32eeb0e5025b6c88125ab769fb537cd365c92"
           )

prepare() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"

	mkdir -p "${pkgdir}/opt/pleroma"
    find release -executable -exec chmod a+rx {} \;
	cp -r release/* "${pkgdir}/opt/pleroma"
	install -Dm 644 pleroma.sysusers "${pkgdir}/usr/lib/sysusers.d/pleroma.conf"
	install -Dm 644 pleroma.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pleroma.conf"
    install -Dm 644 pleroma.service "${pkgdir}/usr/lib/systemd/system/pleroma.service"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 AGPL-3 "${pkgdir}/usr/share/licenses/${pkgname}/AGPL-3"
    install -Dm 644 CC-BY-4.0 "${pkgdir}/usr/share/licenses/${pkgname}/CC-BY-4.0"
    install -Dm 644 CC-BY-SA-4.0 "${pkgdir}/usr/share/licenses/${pkgname}/CC-BY-SA-4.0"
}
