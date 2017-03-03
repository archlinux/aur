# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-workarounds
pkgver=4
pkgrel=1
pkgdesc='Workarounds for modular and minimal Pantheon Desktop Environments'
arch=('i686' 'x86_64')
url='https://launchpad.net/gala'
license=('GPL3')
depends=('gconf' gnome-{keyring,settings-daemon{,-compat},session}
         'polkit-gnome' 'xdg-user-dirs-gtk' 'libgala')
makedepends=('bzr' 'intltool')
conflicts=(pantheon-session{,-bzr})
install='gala.install'
source=("pantheon-session::bzr+lp:~elementary-os/elementaryos/pantheon-xsession-settings"
        'pantheon-session.sh'
        'gnome-fallback-media-keys-helper-pantheon.desktop'
        'gnome-fallback-background-helper-pantheon.desktop'
        'gnome-fallback-mount-helper-pantheon.desktop')
sha512sums=('SKIP'
            'b2630c31724675c247b7017eea0862c76ec80a9f46691b65bc7f76702a9cacda46d9350d3bddc05ee21ded154f4d8ab277d536439152972dca0764f28e62cb38'
            'b01a18bb7829eb7a48b72c90bdf5aa5913c24247426e0bfc509cba22f49d2d8c9eb301e1937b70f3f7f01a873c987e0bdea6dd5f24f8d900b952188fa5635d39'
            '0df6355d85d2329e245593408a74d09281c0dcea206ed594a7312b78db4d3cd57941a5ec29be780f965128fe512532edae85ffaf11a94b57374d5906875967fc'
            'c06e3b8c59681ebe64fa0dd724eea1d40a579956372ce0851f30ededdda3ac41d329d40e5463bd779daba0d55853faec357203b042a4de3d601eafc8b09c350e')

prepare() {
  sed 's|policykit-1|polkit|' -i pantheon-session/autostart/polkit-gnome-authentication-agent-1-pantheon.desktop

  cd "pantheon-session"
  export pkgverpantheonsession="$(printf "r%s" "$(bzr revno)")"

  # TODO: sort and tweak pantheon-session's settings

  # This space reserved for pantheon-default-settings(-bzr)
}

package() {
  cd "${srcdir}"/pantheon-session

  mkdir -p "${pkgdir}"/{etc/xdg,usr/share/pantheon}
  cp -dr --no-preserve='ownership' autostart "${pkgdir}/etc/xdg/"
  cp -dr --no-preserve='ownership' unity-greeter "${pkgdir}/usr/share/"
  cp -dr --no-preserve='ownership' applications "${pkgdir}/usr/share/pantheon/"

  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-media-keys-helper-pantheon.desktop
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-background-helper-pantheon.desktop
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-mount-helper-pantheon.desktop

  # This space reserved for pantheon-default-settings-bzr

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +

# gnome-session workaround
  install -Dm755 "${srcdir}"/pantheon-session.sh "${pkgdir}"/usr/bin/pantheon-session
}

