# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname=zephyr-sdk
pkgver=0.9.5
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64')
url="https://www.zephyrproject.org/"
license=('Apache')
depends=('python-breathe' 'python-sphinx' 'python-docutils' 'python-pyaml'
         'python-ply' 'python-pip' 'python-setuptools' 'python-wheel'
         'python-pyelftools' 'python-pyserial' 'python-pykwalify'
         'git-spindle' 'gitlint' 'ninja' 'gperf' 'ccache'
         'doxygen' 'dfu-util' 'dtc' 'cmake>=3.8.2')
optdepends=('pyocd: programming and debugging ARM MCUs')
makedepends=('patchelf')
source=("https://github.com/zephyrproject-rtos/meta-zephyr-sdk/releases/download/${pkgver}/zephyr-sdk-${pkgver}-setup.run"
        "zephyrrc")

options=(!strip)
backup=('etc/zephyrrc')
install=$pkgname.install

_installdir=/opt/zephyr-sdk
_setupsh=setup.sh

build() {
  cd "$srcdir"
}

_list_toolchains() {
  echo $(sed -n "s/\.\/zephyr-sdk-baremetal-x86_64-meta-toolchain-\([a-zA-Z0-9-]\+\)-toolchain-[0-9.]\+\.sh.*/\1/p" $1 | sort)
}

package ()
{
  cd "$srcdir"
  mkdir -p $pkgdir/$_installdir
  echo ">>> Running installer...."
  sh zephyr-sdk-${pkgver}-setup.run --target $pkgdir/$_installdir --nochown --noexec --keep -- -d $pkgdir/$_installdir

  # Add a flag to not relocate executables, because the path to pkgdir is invalid after installation
  # -R disables relocation, -S saves the relocation script so that it can be run manually.
  sed -i 's#^\(\./zephyr-sdk-x86_64-hosttools-standalone-[0-9.]\+sh\)#\1 -R -S#' $pkgdir/$_installdir/setup.sh

  # Install hosttools always, but let the toolchains be selectable below:
  echo ">>> Available toolchains: $(_list_toolchains $pkgdir/$_installdir/$_setupsh)"

  local DISABLED_TOOLCHAINS=""
  #local DISABLED_TOOLCHAINS="i586 arc iamcu mips32r2 nios2 xtensa riscv32"

  echo ">>> Disabled toolchains: $(echo ${DISABLED_TOOLCHAINS} | xargs -n 1 | sort | xargs)"

  for tc in $DISABLED_TOOLCHAINS
  do
      sed -i "/\.\/zephyr-sdk-baremetal-x86_64-meta-toolchain-${tc}-toolchain-[0-9.]\+\.sh.*/,+3d" $pkgdir/$_installdir/$_setupsh
  done

  echo ">>> Installing toolchains: $(_list_toolchains $pkgdir/$_installdir/$_setupsh)"

  # Because we chose not to relocate binaries, we need to make the default path work.
  # The version here is the toolchain version, in the filename of each toolchain.
  #
  # Alternatively, we can relocate the binaries, either using the stock relocation
  # script or using:
  #
  #    find $pkgdir/$_installdir -type f -executable -exec \
  #        patchelf --set-interpreter /opt/zephyr-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2 \
  #                 --set-rpath /opt/zephyr-sdk/sysroots/x86_64-pokysdk-linux/lib:/opt/zephyr-sdk/sysroots/x86_64-pokysdk-linux/usr/lib {} \;
  #
  local _ver="$(sed -n "s/^\.\/zephyr-sdk-baremetal-x86_64-meta-toolchain-[a-zA-Z0-9]\+-toolchain-\([0-9.]\+\)\.sh.*/\1/p" $pkgdir/$_installdir/$_setupsh | uniq)"
  for v in $_ver
  do
      ln -s $_installdir $pkgdir/$_installdir/$v
  done

  bash -c "cd $pkgdir/$_installdir && ./$_setupsh -d $pkgdir/$_installdir"

  install -Dm644 zephyrrc $pkgdir/etc/zephyrrc
}

# vim:set ts=2 sw=2 et:
sha256sums=('a5c483c099382036a87c02c7b4b1f4b32a31572fcb4a890b474b46b6e8cec647'
            '7a1257272c64bdec281283d391e3149cece065935c9e8394d6bece32d0f6fc05')
