# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>

pkgname="python-beancount-import"
_name="beancount-import"
pkgver=1.5.0
pkgrel=1
pkgdesc="Semi-automatic importer from external data sources into beancount"
arch=("any")
url="https://github.com/jbms/beancount-import"
license=("GPL-2.0-only")
depends=("beancount"
         "beangulp"
         "beanquery"
         "python"
         "python-atomicwrites"
         "python-cachetools"
         "python-dateutil"
         "python-jsonschema"
         "python-nltk"
         "python-numpy"
         "python-scikit-learn"
         "python-scipy"
         "python-tornado"
         "python-typing_extensions"
         "python-watchdog")
makedepends=("esbuild" "npm" "python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7249d5feeb3ff3dba498336cf5778535029f28ad148f2ab5d5731dd9d867af3')

prepare(){
 cd "$_name-$pkgver"
 # the frontend is bundled in build(), setup.py would bundle it again with npm's esbuild
 sed -i 's/self.skip_rebuild = False/self.skip_rebuild = True/' setup.py
}

build(){
 cd "$_name-$pkgver/frontend"
 # install scripts are blocked by npm, bundle with the system esbuild instead
 npm ci --ignore-scripts
 esbuild --bundle app.tsx --sourcemap --minify --outdir=../beancount_import/frontend_dist --define:global=window "--define:process.env.NODE_ENV='production'"
 cd ..
 export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
