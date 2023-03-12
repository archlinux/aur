# Maintainer: Josep Mengual <josep at truita dot es>

pkgname=newleaf
_repo=NewLeaf
pkgdesc="A YouTube data extractor, compatible with the Invidious API."
pkgver=r122.82f28cb
pkgrel=1
arch=('x86_64')
url="https://sr.ht/~cadence/tube/"
license=('AGPL3')
makedepends=(git python-build python-installer python-wheel python-setuptools)
depends=(python python-cherrypy yt-dlp python-cachetools python-dateutil python-requests)
provides=('newleaf')
conflicts=('newleaf')
source=("git+https://git.sr.ht/~cadence/$_repo"
	'newleaf'
	'newleaf.conf'
	'newleaf.service'
	'newleaf.socket'
	'pyproject.toml'
	'change-web-root-path.patch'
)
sha256sums=('SKIP'
            '1113c3c65adafdb40257babf3d6f50f8368aa5122c25ee291b5ddb27d5ecbb30'
            'f43ba9354ac49b9847daa2bbc7cffca0b3a8c381e3b34a0c48f8936a072465df'
            'e8d49375fe484781df9b06fc6c00641200b2589c34c3dd9a72ad6c263ed21520'
            '2fe8f20bec277f81efcf4c62f18bbf4ccf0109663910819acad5bbff8ee0cf5c'
            '631c87c67fd46e56aedd6564bae7f1324f016b78dbfbda7b71d08e4683609bee'
            '2bc6fec3e63625f72397d16aafef1eb5dbf4c3472f7e9acee28f50486550680e')
install=post.install

pkgver() {
    cd "$_repo"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_repo"

    patch --forward --strip=1 --input="${srcdir}/change-web-root-path.patch"

    # Replace relative imports
    shopt -s globstar
    sed -i 's/^from extractors/from newleaf.extractors/gm' **/*.py 
    sed -i 's/^from tools/from newleaf.tools/gm' **/*.py
    sed -i 's/^import extractors/import newleaf.extractors/gm' **/*.py
    sed -i 's/^import tools/import newleaf.tools/gm' **/*.py

    # Remove unnecesary files
    rm LICENSE requirements.txt README.md Dockerfile

    # This is so newleaf gets recognized as a project in setuptools
    filelist=$(echo * | tr ' ' "\n" | grep -v 'configuration.sample.py\|root\|index.py\|newleaf' | tr "\n" ' ')
    mkdir -p "newleaf"
    cp -r $filelist -t newleaf
    cp "index.py" "newleaf/__main__.py"
    cp "$srcdir/pyproject.toml" .
}

build() {
    cd "$_repo"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm755 newleaf "$pkgdir/usr/bin/newleaf"
    install -Dm644 newleaf.conf "$pkgdir/usr/lib/sysusers.d/newleaf.conf"
    install -Dm644 newleaf.{service,socket} -t "$pkgdir/usr/lib/systemd/system"
    cd "$_repo"
    mkdir -p "$pkgdir/var/lib/newleaf"
    cp -r root/* "$pkgdir/var/lib/newleaf"
    install -Dm644 configuration.sample.py "$pkgdir/etc/newleaf/configuration.py"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
