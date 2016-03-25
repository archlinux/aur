# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

# 2016-03-25 21:45:57 CET
#   add support for multiple X displays
#   unset used variables
#   version 1.2
# 2014-11-14 13:32:34 EET
#   remove setsid (fixing a crash with non-root Xorg)
#   version 1.1

pkgname=udm
pkgver=1.2
pkgrel=1
pkgdesc='A micro display manager (like cdm, tdm etc.) with multi display/session support. Written in POSIX shell without any dependencies and having only 31 SLOC.'
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

eval "$(LC_ALL=C who -T -m | sed -r -e 's|(.*)|# for eval safety \1|' -e \
  's|^.* ([^ ]*[^0-9])([0-9]+) +[A-Za-z]{3}  ?[0-9]+ [0-9:]+( \([^)]+\))?$|tn="\1";nr="\2"|')"

[ "$tn" = 'tty' -a -n "$nr" ] && {
  printf '\n%s\n' 'Welcome to uDM. Choose what to start next (default has *):'
  while printf '\n\t%s\n\t%s\n\t%s\nchoice: ' \
      "*a   F? Virtual Window Manager" \
      " b   .xinitrc" \
      " c   default shell"; do
    read x
    case "$x" in
      ''|a)
        # setsid causes the new non-root Xorg crash
        #setsid xinit ~/.xinitrc ...
        xinit ~/.xinitrc fvwm -- :"$nr" vt"$nr" -nolisten tcp -dpi 142 -keeptty
        exit
        break ;;
      b)
        xinit ~/.xinitrc -- :"$nr" vt"$nr" -nolisten tcp -dpi 142 -keeptty
        exit
        break ;;
      c)
        break ;;
      *)
        printf %s 'ERR Unknown answer.' ;;
    esac
  done
}
unset tn nr x
UDM
  chmod 755 "$_f"
}
