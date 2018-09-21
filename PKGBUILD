# Maintainer: Salamandar <felix at piedallu dot me>

pkgname='freecad-assembly3-git'
pkgver=r247.f8dfcd6
pkgrel=1
pkgdesc="Assembly3 workbench for FreeCAD v0.18"
arch=('x86_64')
license=('GPL3')
url="https://github.com/realthunder/FreeCAD_assembly3"
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)
depends=(
  'freecad-linkstage3-git'
  'python'
)

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init slvs

  mkdir slvs/build -p
  pushd slvs/build >/dev/null
  cmake -DBUILD_PYTHON=1 -DOpenGL_GL_PREFERENCE=GLVND ..
  make _slvs
  cp src/swig/python/{slvs.py,_slvs.so} ../../py_slvs
  popd >/dev/null
  touch py_slvs/__init__.py

}

package() {
  cd "${pkgname}"
  install -d \
    "${pkgdir}/usr/lib/freecad/Ext/freecad/asm3"

  rsync -qav \
    --exclude='.git' \
    --exclude='slvs' \
    --exclude='py_slvs_mac' \
    "${srcdir}/${pkgname}/" \
    "${pkgdir}/usr/lib/freecad/Ext/freecad/asm3"
}
