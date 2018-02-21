# Maintainer: Fabian Zaremba <fabian@youremail.eu>

pkgname=jupyterlab-git
pkgver=0.31.6.r21.g97e1decaf
pkgrel=1
pkgdesc="JupyterLab computational environment."
url="https://jupyter.org"
depends=('python' 'jupyter>=4.1.0-5')
makedepends=('python3' 'npm' 'typescript' 'yarn')
license=('BSD')
conflicts=('jupyterlab')
provides=('jupyterlab')
arch=('any')
install='jupyterlab-git.install'
source=('git+https://github.com/jupyterlab/jupyterlab.git'
        'git+https://github.com/jupyterlab/jupyterlab_launcher.git'
        'jupyterlab-git.install')
sha256sums=('SKIP'
            'SKIP'
            'ad628adfa2aa6997ffc05352b86e75f1fe23f60b5e056cc0bd23f5d6f87ad4e9')

pkgver() {
	cd "$srcdir/jupyterlab"
	git describe --match "v*" --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"

	mkdir path
	export PATH="$PATH:$(pwd)/path"
	ln -s /usr/bin/yarn path/jlpm	

	cd "$srcdir/jupyterlab"
	yarn install
	yarn run build
	yarn run build:core

	# How to build app dir assets when jupyterlab is not installed yet?
	# Optional according to wiki
	jupyter lab build || true
}


check() {
	echo "Skipping tests.."

	#cd "$srcdir/jupyterlab"
	#yarn run build:test
	#yarn test
}

package() {
	cd "$srcdir/jupyterlab_launcher"
	python setup.py install --root="$pkgdir" --optimize=1
	cd "$srcdir/jupyterlab"
	python setup.py install --root="$pkgdir" --optimize=1
}
