# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=FastFlix
pkgname=${_UpstreamPkgName,,}
pkgver=5.4.0
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
        allow-python310.patch
        FastFlix.desktop)
sha256sums=('SKIP'
            '7915817b3b4b7f987b50cf9bae60259ff7113c8c7985dc9b980ee5cb9154e754'
            'cbcb6f228b858a69a860aa6a3283f0f4293e1246485566d20f60a93030f1f847')

prepare() {
	cd $_UpstreamPkgName
	patch --forward --strip=1 --input="${srcdir}/allow-python310.patch"
}

build() {
	cd ${_UpstreamPkgName}
	python -m venv venv
	source ./venv/bin/activate
	python -m pip install --upgrade pip setuptools poetry --ignore-installed
	poetry config virtualenvs.create false --local
	poetry install --with dev --with test || true
	poetry install --with dev --with test
	cp $(python -c "import iso639; print(iso639.mapping.TABLE_PATH)") iso-639-3.tab
	cp $(python -c "import iso639; print(iso639.mapping.MAPPING_PATH)") iso-639-3.json
	pyinstaller FastFlix_Nix_OneFile.spec
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

check() {
	cd ${_UpstreamPkgName}
	chmod +x dist/FastFlix
	dist/FastFlix --version
	dist/FastFlix --test
}

