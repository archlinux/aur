# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

# Fork of Arch's official swig packaging, pinned to the last release
# that still generates valid Python 2 wrapper code. Commit f505f2566
# ("Python: Drop PY_VERSION_HEX<3.5 code", 2025-09-15, upstream
# github.com/swig/swig) removed Python 2 support from
# Lib/python/pyrun.swg right after the v4.4.0 tag -- every release from
# 4.5.0 onward emits
# `#error "This version of SWIG only supports Python >= 3.5"` in any
# generated *PYTHON_wrap.c, which breaks building Python bindings
# against python2. Kept here, installed to /opt/swig4.4 alongside the
# real `swig` package, for any package that still needs to generate
# python2 SWIG bindings (first use: obexftp).
#
# This repo's history is forked from gitlab.archlinux.org's official
# swig packaging at its last 4.4.0 commit (tag 4.4.0-3) -- not a fresh
# PKGBUILD written from scratch -- so the upstream packaging fixes
# below (prepare() sed/cherry-pick) are inherited, not reinvented.

# Note:
# When bumping major or minor versions, some downstream packages that use somewhat
# unorthodox runtime arrangements need rebuilding to match. After SWIG version
# bumps please rebuild first python-pivy then freecad in addition to usual suspects.
# c.f. https://github.com/FreeCAD/FreeCAD/issues/25048#issuecomment-3627741495
# c.f. https://gitlab.archlinux.org/archlinux/packaging/packages/python-pivy/-/issues/1
# c.f. https://gitlab.archlinux.org/archlinux/packaging/packages/swig/-/issues/2

_pkgname=swig
pkgname=swig4.4
pkgver=4.4.0
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code (pinned to the last release supporting Python 2 bindings)"
arch=('x86_64')
url="https://www.swig.org/"
license=(
  GPL-3.0-or-later
  LicenseRef-BSD-Arizona
  LicenseRef-BSD-Chicago
  LicenseRef-BSD-Utah-California
)
depends=('gcc-libs' 'glibc' 'pcre2' 'zlib')
makedepends=('git')
source=(git+https://github.com/${_pkgname}/${_pkgname}#tag=v$pkgver)
sha512sums=('eed3eb9b8c769661e039718982a17c2a39907023085ec2e7f957664456a8816c376756278cc2667ce73818fe986f26d4479819c7f0d50e43fa5dea012d742c90')

prepare() {
  sed -n '5,32p' ${_pkgname}/LICENSE-UNIVERSITIES > LicenseRef-BSD-Utah-California.txt
  sed -n '37,64p' ${_pkgname}/LICENSE-UNIVERSITIES > LicenseRef-BSD-Chicago.txt
  sed -n '69,94p' ${_pkgname}/LICENSE-UNIVERSITIES > LicenseRef-BSD-Arizona.txt

  # https://github.com/swig/swig/issues/2858
  sed '/stl_no_default_constructor/d' -i ${_pkgname}/Examples/test-suite/common.mk

  # https://github.com/swig/swig/issues/2859
  sed '/li_std_list/d' -i ${_pkgname}/Examples/test-suite/java/Makefile.in

  git -C ${_pkgname} cherry-pick -n b16a7c958a561721d164183f682d1511dc7c900b # Fix crash in R test

  cd ${_pkgname}
  ./autogen.sh
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/opt/${pkgname}
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ../*.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/

  # coexist with the real swig package: /opt/swig4.4 holds the real
  # install, /usr/bin gets suffixed symlinks only (same pattern as the
  # project's own cmake2's "-2" suffix)
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/opt/${pkgname}/bin/*; do
    ln -s /opt/${pkgname}/bin/$(basename "$b") "${pkgdir}"/usr/bin/$(basename "$b")4.4
  done
}
