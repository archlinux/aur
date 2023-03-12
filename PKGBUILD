# Maintainer: Samuel Bernard <samuel.bernard@gmail.com>
pkgname=almond
pkgver=0.13.4
pkgrel=1
_scalaver=3.1.3
pkgdesc="A scala kernel for Jupyter"
arch=('any')
url="https://almond.sh/"
license=('BSD')
makedepends=('coursier')
depends=('jupyter-notebook-shim')

# Regarding versions:
#  - https://almond.sh/docs/install-versions
#  - https://repo1.maven.org/maven2/sh/almond/

source=("kernel.json.template")
md5sums=('c8015b7cd10ab14c914eb688c3886703')

package() {
  cd "${srcdir}"

  export SCALA_VERSION=${_scalaver}
  export ALMOND_VERSION=${pkgver}

  export COURSIER_CACHE="$pkgdir/usr/share/almond/coursier/cache"
  mkdir -p $COURSIER_CACHE
  export COURSIER_JVM_CACHE="$pkgdir/usr/share/almond/coursier/jvm_cache"
  mkdir -p $COURSIER_JVM_CACHE

  coursier bootstrap almond:$ALMOND_VERSION \
    --scala $SCALA_VERSION \
    --embed-files=false \
    --output almond --force

  ./almond --install --jupyter-path "$pkgdir/usr/share/jupyter/kernels/" \
    --display-name "Scala ${SCALA_VERSION} (almond ${ALMOND_VERSION})"

  sed -i "s|$pkgdir||g" $pkgdir/usr/share/jupyter/kernels/scala/kernel.json
}

#
# makepkg --printsrcinfo > .SRCINFO
#
