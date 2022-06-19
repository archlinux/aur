# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=FastFlix
pkgname=${_UpstreamPkgName,,}
pkgver=4.9.4
pkgrel=1
pkgdesc="Simple and friendly GUI for encoding videos"
arch=('x86_64')
url="https://github.com/cdgriffith/$_UpstreamPkgName"
license=('MIT')
makedepends=('git' 'python' 'icoutils')
depends=('zlib' 'ffmpeg')
optdepends=('nvenc: hardware accelerated encoding on NVIDIA cards'
	    'x265: encoding to H265/HEVC'
	    'x264: encoding to H264/AVC'
            'rav1e: encoding to AV1'
	    'libwebp: encoding to WebP')
source=(git+${url}.git#tag=${pkgver}
        FastFlix.desktop)
sha256sums=('SKIP'
            'cbcb6f228b858a69a860aa6a3283f0f4293e1246485566d20f60a93030f1f847')

build() {
	cd ${_UpstreamPkgName}
	python -m venv venv
	source ./venv/bin/activate
	python -m pip install --upgrade pip setuptools --ignore-installed
	python -m pip install --upgrade wheel typing_extensions pyinstaller
	python -m pip install -r requirements.txt
	cp $(python -c "import iso639; print(iso639.mapping.TABLE_PATH)") iso-639-3.tab
	cp $(python -c "import iso639; print(iso639.mapping.MAPPING_PATH)") iso-639-3.json
	python -m PyInstaller FastFlix_Nix_OneFile.spec
	# convert icon.ico to png for desktop file
	icotool --extract --index=1 -o FastFlix.png fastflix/data/icon.ico
}

package() {
	cd ${_UpstreamPkgName}
	install -Dm 755 -t "${pkgdir}/usr/bin" dist/FastFlix
	# install icon and desktop file
	install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" FastFlix.png
	install -Dm 644 -t "${pkgdir}/usr/share/applications" "${srcdir}/FastFlix.desktop"
	# since it is MIT we need to install a license file
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
