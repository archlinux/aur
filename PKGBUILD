# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=archivy-git
pkgver=v1.4.0.r4.g1183863
pkgrel=4
pkgdesc="A self-hosted knowledge repository, to preserve useful content to your knowledge bank."
arch=('any')
url="https://github.com/archivy/archivy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-flask' 'python-flask-wtf' 'python-wtforms'
         'python-werkzeug' 'python-appdirs' 'python-attrs'
         'python-beautifulsoup4' 'python-elasticsearch'
         'python-dotenv' 'python-frontmatter' 'python-requests'
         'python-tinydb' 'python-validators' 'python-flask-login' 'python-brotli'
         'python-click-plugins' 'python-html2text' 'python-flask-compress')
optdepends=('elasticsearch')
source=("git+https://github.com/archivy/archivy.git#commit=11838634e6b171ba49533f6db1230ddd1a332eab"
        "00-do-not-pin-requirements.patch"
        "01-flask-v2.patch")
sha256sums=('SKIP'
            '538f7d96138f421d70ed72a8f101c1095726d5ee53c19e6cd924b30ca6a7a3a4'
            'f385bd52038f102653a5def0488db28003baaeb52170180d03d5276e6d8fc6cc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")


prepare() {
    cd "$srcdir/${pkgname%-git}"
    git apply "$srcdir/00-do-not-pin-requirements.patch"
    git apply "$srcdir/01-flask-v2.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
