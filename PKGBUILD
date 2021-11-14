# Maintainer: Quentin Bouvet < qbouvet at outlook >
pkgname=almond
pkgver=0.11.2
pkgrel=1
_scalaver=2.13.1
pkgdesc="A scala kernel for Jupyter"
arch=('any')
url="https://almond.sh/"
license=('BSD')
makedepends=('coursier')
depends=('scala' 'jupyter')

# Regarding versions: 
#  - https://almond.sh/docs/install-versions
#  - https://repo1.maven.org/maven2/sh/almond/

source=("${pkgname}-${pkgver}::https://github.com/almond-sh/almond/archive/refs/tags/v${pkgver}.tar.gz" 
		"kernel.json.template")
#install=${pkgname}.install
md5sums=('1d70b12fc9420252736340080c916ac3' 
		 'c8015b7cd10ab14c914eb688c3886703')

package() {
	
	cd "${srcdir}"

	export SCALA_VERSION=${_scalaver}
	export ALMOND_VERSION=${pkgver}

	export COURSIER_CACHE="$pkgdir/usr/share/almond/coursier/cache"
	mkdir -p $COURSIER_CACHE
	
	export COURSIER_JVM_CACHE="$pkgdir/usr/share/almond/coursier/jvm_cache"
	mkdir -p $COURSIER_JVM_CACHE

	#  Alternative way for reference: 
	#
	#coursier launch almond:${pkgver} -M almond.ScalaKernel \
	#  --scala ${_scalaver} --fork \
	#  -- \
	#    --install --jupyter-path $pkgdir/usr/share/jupyter/kernels
	#
	#install -Dm644 kernel.json -t "$pkgdir/usr/share/jupyter/kernels/scala/"

	# (!) -M option is needed for new versions but not for old versions of almond
	coursier bootstrap almond:$ALMOND_VERSION \
      --scala $SCALA_VERSION \
      --sources --default=true \
      --embed-files=false \
	  -M almond.ScalaKernel \
	  -o almond -f

	./almond --install --jupyter-path "$pkgdir/usr/share/jupyter/kernels/"
	
	envsubst < "$srcdir"/kernel.json.template > "$pkgdir/usr/share/jupyter/kernels/scala/kernel.json"
	chmod 644 "$pkgdir/usr/share/jupyter/kernels/scala/kernel.json"

}

#
# makepkg --printsrcinfo > .SRCINFO
#

