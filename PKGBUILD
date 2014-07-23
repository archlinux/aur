# Contributor && Maintarner: Swift Geek <swiftgeek ɐt gmail døt com>
# TODO: ADD parser for config in /etc/makepkg.d/. Use that config instead of auto-detection! tidier code
# TODO: FIND AND FIX EDGE CASES (EMPTY VARS!) *SPANK*

pkgname=firefox-nightly-i18n
_version=34.0a1
pkgver=34.0a1.20140722
pkgrel=1
pkgdesc='Universal i18n for firefox-nightly - xpi version'
url="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi/"
arch=('i686' 'x86_64')
license=('MPL')
depends=('firefox-nightly')

pkgver() {
  echo "${_version}.$(date +%Y%m%d)"
}

countdown() {
  local i
  for ((i=$1; i>=1; i--)); do
    [[ ! -e /proc/$$ ]] && exit
    echo -ne "\rPress [i] to start interactive config in $i second(s) or any key to skip "
    sleep 1
  done
}

ls_lang () {
{  ftp -in ftp.mozilla.org <<EOF
user anonymous secrets
cd /pub/firefox/nightly/latest-mozilla-central-l10n/linux-$CARCH/xpi/
ls
EOF
[ "$?" != 0 ] && error "FTP connection failed" && exit 1
} | grep ftp.*ftp.*firefox.*langpack.xpi$ | awk -F\. '{print $(NF-2)}' | tr '\n' ' '
}

prepare() {
  cd "${srcdir}"
  msg "Getting LANG-packs list from ftp.mozilla.com…"
  srv_lang_list=($(ls_lang))
  msg2 "Available LANG-packs on the server: ${srv_lang_list[*]}"
  sys_lang_list=($(grep -v \# /etc/locale.gen | awk -F\. '{print $1};'| tr '_' '-' | tr '\n' ' '))
  msg2 "Detected LANGs: ${sys_lang_list[*]}"

  # Matching results against system
  #TODO: fix for ja-JP-mac
  for i in ${!sys_lang_list[*]}; do
    if [[ " ${srv_lang_list[*]} " == *" ${sys_lang_list[$i]} "* ]]; then
      #echo "Perfect match"
      true
    elif [[ " ${srv_lang_list[*]} " == *" ${sys_lang_list[$i]%-*} "* ]]; then
      #echo "Cutted match"
      sys_lang_list[$i]=${sys_lang_list[$i]%-*}
    else
      warning "${sys_lang_list[$i]} was not found on the server - removing"
      unset sys_lang_list[$i]
    fi
  done
  msg "Matched LANGs: ${sys_lang_list[*]}"

  [[ "$(cat /proc/$$/cmdline)" != *noconfirm* ]] && tty -s && {
    countdown 10 & countdown_pid=$!
    read -s -n 1 -t 10 ikey || true
    kill -s SIGHUP $countdown_pid > /dev/null || true # Any key below 1sec fix
    echo -e -n "\n"
  }

  if [ "$ikey" = "i" -o "$ikey" = "I" ]; then
    # Pre-select menu items
    for item in ${srv_lang_list[*]}; do
      if [[ " ${sys_lang_list[*]} " == *" ${item} "* ]]; then
        menu_lang_list+=($item on)
      else
        menu_lang_list+=($item off)
      fi
    done
    # echo ${menu_lang_list[*]} # DEBUG ECHO!
    # Display dialog
    selected_lang_list=$(dialog --keep-tite --backtitle "$pkgname" --no-items --checklist 'Choose langpacks to include' 0 0 0 "${menu_lang_list[@]}" 2>&1 >/dev/tty)
    msg2 "Selected LANG-packs: ${selected_lang_list[*]} "
    [ -z "${selected_lang_list[*]}" ] && error "Nothing was selected" && exit 1
  else
    [ -z "${sys_lang_list[*]}" ] && exit 1
    selected_lang_list=${sys_lang_list[*]}
    msg2 "Assuming auto-detect was good"
  fi
  #DL
  msg "Downloading langpacks…"
  for i in ${selected_lang_list[*]}; do
    msg2 "${i}…"
    curl -OR "https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n/linux-${CARCH}/xpi/firefox-${_version}.${i}.langpack.xpi"
  done
}

package () {
  cd ${srcdir}
  install -d ${pkgdir}/opt/firefox-${_version}/browser/extensions/
  install -d ${pkgdir}/opt/firefox-${_version}/defaults/pref
  echo 'pref("intl.locale.matchOS", true);' >> ${pkgdir}/opt/firefox-${_version}/defaults/pref/lang-pref.js
  for item in ${srcdir}/*.xpi; do
    iitem=$(basename $item)
    iitem=${iitem/.langpack.xpi/@firefox.mozilla.org.xpi}
    iitem=${iitem/firefox-${_version}./langpack-}
    install -m644 $item ${pkgdir}/opt/firefox-${_version}/browser/extensions/$iitem
  done
}
