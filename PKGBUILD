# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

_pkgbase=scons
pkgname=scons2
pkgver=3.1.2
pkgrel=2
pkgdesc="Extensible Python-based build utility. Python2 version"
arch=('any')
url="https://scons.org"
license=('MIT')
conflicts=('python2-scons') # https://github.com/bartoszek/AUR-python2-scons
provides=('python2-scons')
depends=('python')
makedepends+=('python-setuptools' 'python2-setuptools')
makedepends+=('docbook2x' 'fop' 'texlive-bin' 'graphviz' 'ghostscript'
'lynx' 'python-lxml' 'texlive-latexextra')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/${_pkgbase}/${_pkgbase}/archive/${pkgver}.tar.gz")
sha512sums=('7d597e681d00918342c64afc61410d961f0516f2e054669d3ef76fcddcbf13b4e24990bdd7c46f3f4369ad2f45ba3fe0173e33edc15e846096bbea10b23fb7c1')

prepare() {
   cd "${_pkgbase}-${pkgver}"
   local _copyright='Copyright (c) 2001 - 2019 The SCons Foundation'
   local _date_of_release="$(grep "RELEASE ${pkgver}" src/CHANGES.txt | cut -d ',' -f2)"
   local _date="$(date -d "${_date_of_release}" +'%Y-%m-%d %H:%M:%S')"
   # copy scripts to correct locations and change their globals
   for _script in scons{,ign,-time,-configure-cache}; do
     cp -v "src/script/${_script}.py" "src/script/${_script}"
     sed -e "s|__COPYRIGHT__|${_copyright}|g" \
         -e "s|__FILE__|/src/script/${_script}|g" \
         -e 's/__REVISION__/none/g' \
         -e "s|__DATE__|${_date}|g" \
         -e 's/__BUILDSYS__/none/g' \
         -e 's/__DEVELOPER__/none/g' \
         -e "s/__VERSION__/${pkgver}/g" \
         -i "src/script/${_script}"
   done
   sed -e "s|__COPYRIGHT__|${_copyright}|g" \
       -e 's|__FILE__|/src/setup.py|g' \
       -e 's/__REVISION__/none/g' \
       -e "s|__DATE__|${_date}|g" \
       -e 's/__BUILDSYS__/none/g' \
       -e 's/__DEVELOPER__/none/g' \
       -e "s/__VERSION__/${pkgver}/g" \
       -i "src/setup.py" "src/engine/SCons/__init__.py"
   # disabling postscript creation, because it's broken
   sed -e '614,619d' \
       -e '/api_ps =/d' \
       -e 's/api_ps,//' \
       -i doc/SConscript
   # fixing refentrytitle, so man pages are rendered with correct file names
   sed -e 's/refentrytitle>SCONS-TIME/refentrytitle>scons-time/' \
       -e 's/refentrytitle>SCONSIGN/refentrytitle>sconsign/' \
       -e 's/refentrytitle>SCONS/refentrytitle>scons/' \
       -i doc/man/*.xml
    # fix shebang for python2 version
    sed -e 's/env python/env python2/' \
        -i src/script/*
    sed -e 's/python/python2/' \
        -i src/engine/SCons/Tool/docbook/docbook-xsl-*/extensions/xslt.py
}

build() {
    cd "${_pkgbase}-${pkgver}"
    # build documentation
    (
      python bootstrap.py SConstruct doc
      cd src
      for _xml in {scons,sconsign,scons-time}; do
        db2x_docbook2man "../build/doc/man/${_xml}_db.xml"
      done
    )
    (
      cd src
      python setup.py build
    )
}

package() {
  depends=('python2')
  cd "${_pkgbase}-${pkgver}/src"
  python2 setup.py install --prefix=/usr \
                           --skip-build \
                           --optimize=1 \
                           --standard-lib \
                           --install-data=/usr/share \
                           --root="$pkgdir"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGES,README,RELEASE}.txt \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # removing Windows only script
  rm -vf "${pkgdir}/usr/bin/scons"*.bat
  # moving files so scons and python2-scons don't conflict
  for _man_page in scons{,ign,-time}; do
    mv -v "${pkgdir}/usr/share/man/man1/${_man_page}".1 \
      "${pkgdir}/usr/share/man/man1/${_man_page}2".1
  done
  for _bin in scons{,ign,-configure-cache,-time}; do
    mv -v "${pkgdir}/usr/bin/${_bin}"{,2}
    mv -v "${pkgdir}/usr/bin/${_bin}-${pkgver}" "${pkgdir}/usr/bin/${_bin}2-${pkgver}"
  done
}
