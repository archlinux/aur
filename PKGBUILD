# Maintainer: Drommer <drommer@github.com>

pkgname=vapoursynth-plugin-hybrid-pack-git
pkgver=r144.7efca43
pkgrel=1
pkgdesc="Vapoursynth plugins from Hybrid Encoder"
arch=('any')
url='https://github.com/Selur/VapoursynthScriptsInHybrid'
license=('GPL')
depends=('vapoursynth' 'vapoursynth-plugin-vsutil-git')
makedepends=('git' 'python')
source=("git+$url.git")
sha256sums=('SKIP')

_gitname="VapoursynthScriptsInHybrid"
_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "$_gitname"

  rm -r "vsutil"
  mv -f "mvsfunc" "$srcdir/mvsfunc_h"
  mv -f "$srcdir/mvsfunc_h/mvsfunc.py" "$srcdir/mvsfunc_h/mvsfunc_h.py"
  sed -i "s|mvsfunc|mvsfunc_h|" "$srcdir/mvsfunc_h/__init__.py"

  for plug in $(find . -name "*.py" -execdir basename {} .py ';') mvsfunc; do
    [ -f $plug.py ] && mv -f "$plug.py" "${plug}_h.py"
    sed -i "/from/b;/import/ s|\<$plug\>|${plug}_h|g" *.py
    sed -i "/import/ s|from \<$plug\>|from ${plug}_h|g" *.py
    sed -i "/http/b; s|\<$plug\>\.|${plug}_h\.|g" *.py
  done
}

package() {
  cd "$_gitname"

  install -Dm644 *.py -t ${pkgdir}${_site_packages}
  python -m compileall -q -f -d ${_site_packages} ${pkgdir}${_site_packages}/*.py
  python -OO -m compileall -q -f -d ${_site_packages} ${pkgdir}${_site_packages}/*.py

  install -Dm644 $srcdir/mvsfunc_h/*.py -t ${pkgdir}${_site_packages}/mvsfunc_h
  python -m compileall -q -f -d ${_site_packages}/mvsfunc_h ${pkgdir}${_site_packages}/mvsfunc_h/mvsfunc_h.py
  python -OO -m compileall -q -f -d ${_site_packages}/mvsfunc_h ${pkgdir}${_site_packages}/mvsfunc_h/mvsfunc_h.py

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/hybrid-pack/README.md"
}
