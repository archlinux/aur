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
pkgrel=7
pkgdesc="Extensible Python-based build utility (Python2 version)"
arch=('any')
url="https://scons.org"
license=('MIT')
conflicts=('python2-scons') # https://github.com/bartoszek/AUR-python2-scons
provides=('python2-scons')
depends=('python2' 'perl' 'ruby')
makedepends+=('python2-setuptools')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/${_pkgbase}/${_pkgbase}/archive/${pkgver}.tar.gz")
sha512sums=('b096501ea37e62f596f16b46b4022ad7979f359b10849d4c5fa17731a6c3ec34e0890374de175a8aa7539ae677777142ccf5dfae39a74696efcdbcc00e89bccf')

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
    rm -r doc
    # fix shebang for python2 version
    sed -e 's/env python/env python2/' \
        -i src/script/*
    sed -e 's/python/python2/' \
        -i src/engine/SCons/Tool/docbook/docbook-xsl-*/extensions/xslt.py
}

build() {
    cd "${_pkgbase}-${pkgver}"
    (
      python2 bootstrap.py SConstruct
      cd src
      python2 setup.py build
    )
}

package() {
  cd "${_pkgbase}-${pkgver}/src"
  python2 setup.py install --prefix=/usr \
                           --skip-build \
                           --optimize=1 \
                           --standard-lib \
                           --no-install-man \
                           --root="$pkgdir"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGES,README,RELEASE}.txt \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # removing Windows only script
  rm -vf "${pkgdir}/usr/bin/scons"*.bat
  for _bin in scons{,ign,-configure-cache,-time}; do
    mv -v "${pkgdir}/usr/bin/${_bin}"{,2}
    mv -v "${pkgdir}/usr/bin/${_bin}-${pkgver}" "${pkgdir}/usr/bin/${_bin}2-${pkgver}"
  done
}
