# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

# 2014-11-14 13:32:34 EET
#   remove setsid (fixing a crash with non-root Xorg)
#   version 1.1

pkgname=udm
pkgver=1.1
pkgrel=1
pkgdesc='A micro display manager similar to cdm, tdm etc. having 26 SLOC in POSIX shell without any dependencies.'
url='http://aur.archlinux.org'
license=('GPL')
arch=('any')
depends=('sh')
provides=('udm')
conflicts=('cdm' 'cdm-simple' 'tdm')

#build() {
#}

#pkgver() {
#  echo 1.0
#}

package() {
  _f="$pkgdir/etc/profile.d/zzz-udm.sh"
  # hopefully `install' knows the right permissions
  install -d "$(dirname "$_f")"
  cat > "$_f" <<\UDM
#!/bin/sh

# FIXME when started from tty2 and X is already running on tty1, we should
#   probably modify DISPLAY to :1, increase the vtX number etc.
[ "$(tty)" = '/dev/tty1' ] && {
  printf '\n%s\n' 'Welcome to uDM. Choose what to start next (default has *):'
  while printf '\n\t%s\n\t%s\n\t%s\nchoice: ' \
      "*a   F? Virtual Window Manager" \
      " b   .xinitrc" \
      " c   default shell"; do
    read x
    case "$x" in
      ''|a)
        # vtX ~ ttyX (reuse the current tty)
        xinit ~/.xinitrc fvwm -- vt1 -nolisten tcp -dpi 130; exit
        # setsid causes the new non-root Xorg crash
        #setsid xinit ~/.xinitrc fvwm -- vt1 -nolisten tcp -dpi 130; exit
        break ;;
      b)
        #setsid xinit ~/.xinitrc -- vt1 -nolisten tcp -dpi 130; exit
        xinit ~/.xinitrc -- vt1 -nolisten tcp -dpi 130; exit
        break ;;
      c)
        break ;;
      *)
        printf %s 'ERR Unknown answer.' ;;
    esac
  done
}
UDM
  chmod 755 "$_f"
}
