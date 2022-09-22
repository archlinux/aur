# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname='lbe'
pkgver=2.8.2
pkgrel=12
pkgdesc="Jarek Gawor's LDAP Browser/Editor (last freeware version)"
arch=('any')
#url="http://www.openchannelsoftware.com/projects/LDAP_Browser_Editor"
url="http://web.archive.org/web/20090201080715/http://mcs.anl.gov/~gawor/ldap/"
license=('custom')
depends=('java-runtime>=8' 'java-runtime<=11')
source=("https://nullroute.lt/mirrors/files/ldapbrowser-$pkgver.zip"
        "Ldap_lic.pdf"
        "lbe.desktop"
        "lbe.sh")
sha256sums=('6c1a1b80b81d83f005d4a006bc070b1b8f44f90151f7af6b14004c96e26687ec'
            '673f71a75aafb1c1367a9b7449a8a2da6cc96235c660bb940d26cd70dba6dabe'
            'ccdc18f2879c6ab10aa0f3ad087a3aa225a6146340be7e2fb46302b961255972'
            '74e216ae7034236520c5c16addb4371dccb0dbea573cf0d735348765346ccfb1')

package() {
  # Java program files
  # (lib/*.jar only contains a copy of JNDI, not needed for any current JRE version)
  mkdir -p "$pkgdir"/usr/lib/lbe
  cp -a lbe.jar                       "$pkgdir"/usr/lib/lbe/

  # Docs
  mkdir -p "$pkgdir"/usr/share/doc/lbe
  cp -a *.html help CHANGES.TXT       "$pkgdir"/usr/share/doc/lbe/

  # Initial config directory
  mkdir -p "$pkgdir"/usr/share/lbe/skel
  cp -a attributes.config templates   "$pkgdir"/usr/share/lbe/skel/
  cp -a help/uofmichigan.cfg.sample   "$pkgdir"/usr/share/lbe/skel/'U of Michigan'.cfg
  ln -s /usr/share/doc/lbe/help       "$pkgdir"/usr/share/lbe/skel/help
  ln -s /etc/ssl/certs/java/cacerts   "$pkgdir"/usr/share/lbe/skel/lbecacerts

  # Licenses (EULA link from readme.html)
  # I guess even the "freeware" versions weren't really freeware, but it
  # doesn't look like ANL ever cared.
  mkdir -p "$pkgdir"/usr/share/licenses/lbe/
  cp -p Ldap_lic.pdf LICENSE.ICONS    "$pkgdir"/usr/share/licenses/lbe/

  # Launcher
  install -Dm755 lbe.desktop          "$pkgdir"/usr/share/applications/lbe.desktop
  install -Dm755 lbe.sh               "$pkgdir"/usr/bin/lbe

  # Customizations
  {
    echo
    echo "# Added by packager"
    echo "krbextradata=binary"
    echo "krbprincipalkey=binary"
  } >> "$pkgdir"/usr/share/lbe/skel/attributes.config
}

# vim: ts=2:sw=2:et
