# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=collabora-online-server-nodocker
pkgver=3.0.0
pkgrel=1
pkgdesc="Collabora CODE (LibreOffice Online) server for Nextcloud or ownCloud, without Docker"
arch=('x86_64')
url="https://www.collaboraoffice.com/code/"
# see also: https://github.com/sfoxdev/docker-collabora-code
license=('MPL')
provides=('libreoffice' 'libreoffice-en-US')
optdepends=(
  'hunspell-de: German hunspell dictionaries for LibreOffice'
  'hunspell-en: English (US, UK, etc.) hunspell dictionaries for LibreOffice'
  'hunspell-en_AU: AU English hunspell dictionaries for LibreOffice'
  'hunspell-en_CA: CA English hunspell dictionaries for LibreOffice'
  'hunspell-en_GB: GB English hunspell dictionaries for LibreOffice'
  'hunspell-en_US: US English hunspell dictionaries for LibreOffice'
  'hunspell-es: Spanish hunspell dictionaries for LibreOffice'
  'hunspell-fr: French (modern) hunspell dictionaries for LibreOffice'
  'hunspell-he: Hebrew hunspell dictionary for LibreOffice'
  'hunspell-it: Italian dictionary for Hunspell for LibreOffice'
  'hunspell-ro: Romanian dictionary for Hunspell for LibreOffice'
  'hunspell-el: Greek hunspell dictionary for LibreOffice'
  'hunspell-hu: Hungarian hunspell dictionary for LibreOffice'
  'hunspell-nl: Dutch hunspell dictionaries for LibreOffice'
  'hunspell-pl: Polish dictionary for Hunspell for LibreOffice'
  'hyphen-de: German hyphenation rules for LibreOffice'
  'hyphen-en: English hyphenation rules for LibreOffice'
  'hyphen-es: Spanish hyphenation rules for LibreOffice'
  'hyphen-fr: French hyphenation rules for LibreOffice'
  'hyphen-it: Italian hyphenation rules for LibreOffice'
  'hyphen-nl: Dutch hyphenation rules for LibreOffice'
  'hyphen-ro: Romanian hyphenation rules for LibreOffice'
  'hyphen-hu: Hungarian hyphenation rules for LibreOffice'
  'hyphen-pl: Polish hyphenation rules for LibreOffice'
)
depends=(cpio)
source=(
  'https://www.collaboraoffice.com/repos/CollaboraOnline/CODE/Packages'
  install
  mkcert_example.sh
  nginx.conf
  sysusers
  tmpfiles
)
sha1sums=(
  'SKIP'
  '3452d27a4c2dd0e6eee4c1c30302fb9b25eac9b8'
  '68ac242ad285eeeca07cb486c22dfbf3a658fe81'
  'fe998836dbbd5c153de77d4ea877f25719dae304'
  '2d271f9493ea14c675af1bfa76f6b654569dd51f'
  'f9c102a06b2582548f13121e78790237e2cb38e1'
)

# From Debian’s conffiles
backup=(
  opt/collaboraoffice5.3/share/psprint/psprint.conf
  etc/loolwsd/loolkitconfig.xcu
  etc/loolwsd/loolwsd.xml
)

# From Debian’s pre/post scripts
install=install

_upstream_deps='loolwsd code-brand'
_upstream_equiv='
  adduser             = 
  cpio                = 
  fontconfig          = fontconfig
  init-system-helpers = 
  libc6               = gcc-libs
  libcairo2           = cairo
  libcap2             = libcap
  libcap2-bin         = libcap
  libcups2            = libcups
  libdbus-glib-1-2    = dbus-glib
  libgcc1             = gcc-libs
  libgl1-mesa-glx     = mesa-libgl
  libodbc1            = unixodbc
  libpng12-0          = libpng12
  libpococrypto48     = poco178
  libpocofoundation48 = poco178
  libpocojson48       = poco178
  libpoconet48        = poco178
  libpoconetssl48     = poco178
  libpocoutil48       = poco178
  libpocoxml48        = poco178
  libsm6              = libsm
  libssl1.0.0         = openssl-1.0
  libstdc++6          = gcc-libs
  libxinerama1        = libxinerama
  zlib1g              = zlib
'
_upstream_handle_dep() {
  local dep="$1"
  local eqv="$(grep "^[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")[[:blank:]]*=" <<<"$_upstream_equiv")"
  local meta="$(awk -F$'\n' -vRS= "/^Package:[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")\\n/{print}" Packages)"
  local seen=
  if [ -n "$eqv" ]; then
    dep="$(sed 's/.*=[[:blank:]]*//' <<<"$eqv")"
    [ -n "$dep" ] || return
    for seen in "${depends[@]}"; do
      [ "$seen" == "$dep" ] && return
    done
    depends[${#depends[*]}]="$dep"
  elif [ -n "$meta" ]; then
    dep="$(sed -rn "s#^Filename:[[:blank:]]*(.*/)?#${source[0]%Packages}#p" <<<"$meta")"
    for seen in "${source[@]}"; do
      [ "$seen" == "$dep" ] && return
    done
    source[${#source[*]}]="$dep"
    sha1sums[${#sha1sums[*]}]="$(sed -rn "s#^SHA1:[[:blank:]]*##p" <<<"$meta")"
    while read dep; do if [ -n "$dep" ]; then
      _upstream_handle_dep "$dep"
    fi; done < <(
        sed -rn "s#^Depends:[[:blank:]]*##p" <<<"$meta" \
      | sed 's#([^)]*)##g; s#[[:blank:]]*,[[:blank:]]*#\n#g'
    )
  else
    echo "Unknown dependency: $dep" >&2; exit 1
  fi
}

if [ ${#source[*]} -eq 6 ]; then
  curl -s "${source[0]}" >Packages
  pkgver=$(
    awk -F$'\n' -vRS= '/^Package:[[:blank:]]*loolwsd\n/{print}' Packages \
    | sed -n 's/^Version:[[:blank:]]*\(.*\)-.*/\1/p'
  )
  for dep in $_upstream_deps; do
    _upstream_handle_dep "$dep"
  done
fi
unset _upstream_handle_dep _upstream_equiv _upstream_deps

package() {
  local data= f=
  cd "$pkgdir"

  for f in "$srcdir"/*.deb; do
    data="$(ar t "$f" | grep ^data)"
    case "$data" in
    *.bz2) ar p "$f" "$data" | tar -xjf - ;;
    *.gz) ar p "$f" "$data" | tar -xzf - ;;
    *.xz) ar p "$f" "$data" | tar -xJf - ;;
    *) echo "Unknown file format: $data" >&2; exit 1 ;;
    esac
  done
  chown -R $(id -nu):$(id -ng) .

  # /lib is deprecated
  mv {lib,usr/lib}

  # use systemd for user allocation
  install -Dm0644 "$srcdir"/sysusers usr/lib/sysusers.d/$pkgname.conf

  # replace cron with systemd
  rm -rf etc/cron.d
  install -Dm0644 "$srcdir"/tmpfiles usr/lib/tmpfiles.d/$pkgname.conf

  # add dependency on systemd
  sed -i '/^\[Unit\]/ a \
After=systemd-tmpfiles-setup.service' usr/lib/systemd/system/loolwsd.service

  # keep the cert-making script from the Dockerfile for reference
  install -Dm0644 "$srcdir"/mkcert_example.sh usr/share/doc/loolwsd/example.mkcert.sh

  # actually provide libreoffice, without conflicting with Archlinux’ libreoffice
  mkdir -p usr/share/applications
  sed -i 's#^Exec=collaboraoffice5.3#Exec=/opt/collaboraoffice5.3/program/soffice#' \
    opt/collaboraoffice5.3/share/xdg/*
  ls opt/collaboraoffice5.3/share/xdg \
  | while read f; do
    case "$f" in
    calc.desktop|draw.desktop|impress.desktop|writer.desktop)
      sed -i "s#^Icon=.*#Icon=/opt/collaboraoffice5.3/share/config/wizard/web/images/${f%.desktop}.gif#" \
        opt/collaboraoffice5.3/share/xdg/$f
      ;;
    *)
      sed -i 's#^Icon=.*#Icon=/opt/collaboraoffice5.3/share/config/wizard/web/images/other.gif#' \
        opt/collaboraoffice5.3/share/xdg/$f
      ;;
    esac
    mv opt/collaboraoffice5.3/share/xdg/"$f" usr/share/applications/"collaboraoffice-$f"
  done
  rm -rf opt/collaboraoffice5.3/share/xdg

  # give some hints about usage
  install -Dm0644 "$srcdir"/nginx.conf usr/share/doc/loolwsd/example.nginx.conf
}
