# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>
_base=awib
pkgname=(${_base}-git ${_base}-elf-git ${_base}-ruby-git ${_base}-tcl-git ${_base}-bash-git)
pkgver=r136.eaf1d79
pkgrel=1
pkgdesc='brainfuck compiler written in brainfuck'
arch=('any')
url='https://github.com/matslina/awib'
license=('GPL')
makedepends=('git' 'python')
source=("${_base}::git+https://github.com/matslina/awib.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_base}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_base}"
  python util/bfpp.py --interpreter awib-skeleton.b > awib.b
  cp awib.b awib.c
  gcc awib.c -o awib.tmp
  rm awib.c
}

package_awib-git()
{
  depends+=("${_base}-elf=${pkgver}")
  install -d "${pkgdir}/usr/bin"
  ln -s "awib-elf" "${pkgdir}/usr/bin/awib"
}

package_awib-elf-git()
{
  provides=("${_base}-elf=${pkgver}")
  conflicts=("${_base}-elf")
  arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
  cd "${srcdir}/${_base}"
  (echo "@lang_c"; cat awib.b) | ./awib.tmp > awib.c
  gcc -O2 awib.c -o awib
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "awib" "${pkgdir}/usr/bin/awib-elf"
}

package_awib-ruby-git()
{
  depends+=('ruby')
  provides=("${_base}-ruby=${pkgver}")
  conflicts=("${_base}-ruby")
  cd "${srcdir}/${_base}"
  (echo "@lang_ruby"; cat awib.b) | ./awib.tmp > awib
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "awib" "${pkgdir}/usr/bin/awib-ruby"
}

package_awib-tcl-git()
{
  depends+=('tcl')
  provides=("${_base}-tcl=${pkgver}")
  conflicts=("${_base}-tcl")
  cd "${srcdir}/${_base}"
  (echo "@lang_tcl"; cat awib.b) | ./awib.tmp > awib
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "awib" "${pkgdir}/usr/bin/awib-tcl"
}

package_awib-bash-git()
{
  provides=("${_base}-bash=${pkgver}")
  conflicts=("${_base}-bash")
  cd "${srcdir}/${_base}"
  (echo "#!/bin/bash"; cat awib.b) | > awib
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "awib" "${pkgdir}/usr/bin/awib-bash"
}
