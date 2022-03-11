# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=FastFlix
pkgname=${_UpstreamPkgName,,}
pkgver=4.7.0
pkgrel=1
pkgdesc="Simple and friendly GUI for encoding videos"
arch=('x86_64')
url="https://github.com/cdgriffith/$_UpstreamPkgName"
license=('MIT')
makedepends=('git' 'python')
depends=('zlib' 'ffmpeg')
optdepends=('nvenc: hardware accelerated encoding on NVIDIA cards'
	    'x265: encoding to H265/HEVC'
	    'x264: encoding to H264/AVC'
            'rav1e: encoding to AV1'
	    'libwebp: encoding to WebP')
source=(git+${url}.git#tag=${pkgver})
sha256sums=('SKIP')

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
}

package() {
	cd ${_UpstreamPkgName}
	install -Dm 755 -t "${pkgdir}/usr/bin" dist/FastFlix
	# since it is MIT we need to install a license file
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
