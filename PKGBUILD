# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

# FIXME
#   solve TeamViewer issue (TV checks for loginctl session type)
#     https://aur.archlinux.org/packages/teamviewer/#pinned-640953
#     => change session type to x11/wayland (possible since systemd 246)
#         https://github.com/swaywm/wlroots/pull/2304/files
#       note, activate -> takecontrol -> settype somehow didn't work (
#           "you must be owner of the terminal to take control")
#   remember last used session (use some file/DB which other DMs use)
#   make DPI user-configurable (is there any quasi-standardized
#       file/DB with such user-preference to aid heuristics?)

# 2020-08-17 16:15:56 UTC+2
#   add wayland support (set XDG_SESSION_TYPE)
#   add XAUTHORITY support
#   print interactive messages to stderr instead of stdout
#   add figlet font for uDM
#   version 1.3
# 2016-11-07 19:08:48 CET
#   fix project URL in PKGBUILD
#   relicensed from GPL to MIT
# 2016-03-25 21:45:57 CET
#   add support for multiple X displays
#   unset used variables
#   version 1.2
# 2014-11-14 13:32:34 EET
#   remove setsid (fixing a crash with non-root Xorg)
#   version 1.1

pkgname=udm
pkgver=1.3
pkgrel=1
pkgdesc='A micro display manager (like cdm, tdm etc.) with Wayland and multi display/session support. Written in POSIX shell with zero dependencies and having only 38 SLOC.'
url="https://aur.archlinux.org/packages/$pkgname"
license=('MIT')
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
  install -d "$( dirname "$_f" )"
  cat > "$_f" <<\UDM
#!/bin/sh

eval "$( LC_ALL=C who -T -m | sed -r -e 's|(.*)|# for eval safety \1|' -e \
  's|^.* ([^ ]*[^0-9])([0-9]+) +[A-Za-z]{3}  ?[0-9]+ [0-9:]+( \([^)]+\))?$|tn="\1";nr="\2"|' )"

if [ "$tn" = 'tty' ] && [ -n "$nr" ]; then
  printf %s '             _____    __  __
Welcome to  |  __ \  |  \/  |
     _   _  | |  | | | \  / |
    | | | | | |  | | | |\/| |
    | |_| | | |__| | | |  | |
     \__,_| |_____/  |_|  |_|  Choose what to start next (default has *):
' >&2

  while printf '\n\t%s\n\t%s\n\t%s\n\t%s\nchoice: ' \
      " a   sway (Wayland)" \
      " b   .xinitrc" \
      "*c   F? Virtual Window Manager (X11)" \
      " d   default shell" >&2; do
    read -r x
    case "$x" in
      a)
        # not needed for wlroots >= 0.12, but it doesn't hurt
        export XDG_SESSION_TYPE=wayland
        exec sway ;;

      ''|b|c)
        export XDG_SESSION_TYPE=x11
        export XAUTHORITY="${XDG_RUNTIME_DIR-/run/user/$( id -u )}/udm_xauth"
        # avoid xauth error message
        touch "$XAUTHORITY"
        xauth add :"$nr" . "$( mcookie )"
        trap 'rm -f -- "$XAUTHORITY"' SIGINT QUIT HUP ABRT TERM EXIT

        if [ "$x" = b ]; then
          # use 'setsid xinit ...' for non-rootless Xorg (i.e. <2014)
          xinit ~/.xinitrc -- :"$nr" vt"$nr" -nolisten tcp -dpi 142 -keeptty
        else
          # .xinitrc "correct" dbus launch (as of 2020):
          #   [ -z "$DBUS_SESSION_BUS_ADDRESS" ] &&
          #       eval "$( dbus-launch --sh-syntax --exit-with-session )"
          #   dbus-update-activation-environment --systemd \
          #       DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
          xinit ~/.xinitrc fvwm -- :"$nr" vt"$nr" -nolisten tcp -dpi 142 -keeptty
        fi
        exit $? ;;

      d) break ;;

      *) printf '%s\n' 'ERR Invalid choice.' >&2 ;;
    esac
  done
fi

unset tn nr x
UDM
  chmod 755 "$_f"
}
