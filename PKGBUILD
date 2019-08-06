# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgbase=scons
pkgname=(scons python2-scons)
pkgver=3.1.0
pkgrel=1
pkgdesc="Extensible Python-based build utility"
arch=('any')
url="https://scons.org"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
# potential additions include ipkg, rpm
checkdepends=('clang' 'dmd' 'gdc' 'ldc' 'nasm' 'python-lxml' 'python-pytest'
'python-virtualenv' 'python2-lxml' 'python2-pytest' 'python2-virtualenv' 'swig'
'zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3894d17bca02b9aa5426c70d894b8ecfcf3db2b20254b848209c31d8413a8cd1c2a7b2a87ef9bcfe5555980beb2815f62cdbe185098a64ae8b3506c41c867463')

prepare() {
  (
   cd "${pkgbase}-${pkgver}"
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
       -i "src/setup.py"
  )
  # we need to copy all sources, because using build with python2 and python3
  # would otherwise overwrite the build created first
  cp -av "${pkgbase}-${pkgver}" "${pkgname[1]}-${pkgver}"
  (
    # fix shebang for python2 version
    cd "${pkgname[1]}-${pkgver}"
    sed -e 's/env python/env python2/' \
        -i src/script/*
    sed -e 's/python/python2/' \
        -i src/engine/SCons/Tool/docbook/docbook-xsl-*/extensions/xslt.py
  )
}

build() {
  (
    cd "${pkgbase}-${pkgver}"
    # build man page and move to src directory
    python bootstrap.py doc/SConscript
    mv -v build/doc/man/* src/
    cd src
    python setup.py build
  )
  (
    cd "${pkgname[1]}-${pkgver}"
    # build man page and move to src directory
    python2 bootstrap.py doc/SConscript
    mv -v build/doc/man/* src/
    cd src
    python2 setup.py build
  )
}

check() {
  (
    cd "${pkgbase}-${pkgver}"
    python runtest.py -a -t || msg "Tests passing with 'NO RESULT' count as failed."
  )
  (
    cd "${pkgname[1]}-${pkgver}"
    python2 runtest.py -a -t || msg "Tests passing with 'NO RESULT' count as failed."
  )
}

package_scons() {
  depends=('python')
  cd "${pkgname}-${pkgver}/src"
  python setup.py install --prefix=/usr \
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
}

package_python2-scons() {
  depends=('python2')
  cd "${pkgname}-${pkgver}/src"
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
