# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>

# Ref.: https://github.com/QubesOS/qubes-gui-agent-linux/tree/master/archlinux

pkgbase=qubes-gui-agent-linux
pkgname=(qubes-vm-gui qubes-vm-pulseaudio)
_gitname=${pkgname%-git*}
pkgver=4.0.38
pkgrel=4
pkgdesc="The Qubes GUI Agent for AppVMs"
arch=("x86_64")
url="https://github.com/QubesOS/qubes-gui-agent-linux"
license=('GPL')
makedepends=(pkg-config make gcc patch git automake autoconf libtool
             'pulseaudio<=16.0'
             xorg-server-devel xorg-util-macros libxcomposite libxt pixman lsb-release
             qubes-vm-gui-common qubes-libvchan qubes-db-vm
)
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-gui-agent-linux.git?signed#tag=v${pkgver}" 'PKGBUILD-z-qubes-session.sh')
sha512sums=('SKIP'
            '79231ea61f50f9ec85223358026bc12b4f8257ca80c01e8d406e1e01213815f48bec7333cca1465c2e941ffe909c236a68a8e64b0e5294ff0e66bebb31a639e1'
)

# Ref.: https://github.com/QubesOS/qubes-builder/blob/master/example-configs/qubes-os-master.conf#L9
qubes_backend_vmm=xen

pa_ver=$((pkg-config --modversion libpulse 2>/dev/null || echo 0.0) | cut -f 1 -d "-")


build() {
  cd "${srcdir}/${_gitname}/"

  rm -f pulse/pulsecore
  ln -s pulsecore-$pa_ver pulse/pulsecore

  # Bug fixes : /var/run/console depends on pam_console, which is fedora specific
  # As a consequece, /var/run/console does not exists and qubes-gui-agent will always fail
  sed 's:ExecStartPre=/bin/touch:#ExecStartPre=/bin/touch:' -i appvm-scripts/qubes-gui-agent.service
  # Ensure that qubes-gui-agent starts after user autologin
  sed 's/After=\(.*\)qubes-misc-post.service/After=\1qubes-misc-post.service getty.target/' -i appvm-scripts/qubes-gui-agent.service

  make BACKEND_VMM="${qubes_backend_vmm}" appvm
  make appvm
}


package_qubes-vm-gui() {
  depends=('xorg-xinit'
           'libxcomposite'
           'zenity'
           'qubes-libvchan-xen'
           'python-xcffib'

           # Xorg dependencies are on specific ABI versions: https://www.x.org/wiki/XorgModuleABIVersions/
           # These can also be verified with pacman -Qi xorg-server (Provides)
           # There is however a discrepency if verifying via pkg-config --variable abi_videodrv xorg-server
           'X-ABI-VIDEODRV_VERSION=25.2' 'X-ABI-XINPUT_VERSION=24.4' 'X-ABI-EXTENSION_VERSION=10.0'
  )
  install=PKGBUILD.install

  cd "${srcdir}/${_gitname}/"

  make install-rh-agent DESTDIR="$pkgdir" LIBDIR=/usr/lib USRLIBDIR=/usr/lib SYSLIBDIR=/usr/lib

  # Specific to archlinux: qubes session needs to be the last started script when Xorg starts.
  # For Fedora Qubes devs team choosed to populate it in /etc/sysconfig/desktop, but this is not supported by Archlinux
  # Using z-qubes-session allows it to be the last started script in xinitrc.d...
  mkdir -p $pkgdir/etc/X11/xinit/xinitrc.d/
  install -D $srcdir/PKGBUILD-z-qubes-session.sh $pkgdir/etc/X11/xinit/xinitrc.d/z-qubes-session.sh
}


package_qubes-vm-pulseaudio() {
  pkgdesc="Pulseaudio support for Qubes VM"
  depends=('alsa-lib'
           'alsa-utils'
           'pulseaudio-alsa'
           'pulseaudio<=16.0'
  )
  install=PKGBUILD-pulseaudio.install

  cd "${srcdir}/${_gitname}/"

  make install-pulseaudio DESTDIR=$pkgdir PA_VER=$pa_ver LIBDIR=/usr/lib USRLIBDIR=/usr/lib SYSLIBDIR=/usr/lib
}
