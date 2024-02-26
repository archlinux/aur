# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# t38modem must be rebuilt on every {ptlib,opal} version or options change or you'll get segfault

# TODO: Update Readme.txt with github links, new versions and improved command lines
# TODO: Can we get multiple STUN servers for redundancy?
#+TODO: The routing patch 0001 sucks. What is the correct patch?. Routing fixed.
#+TODO: Need fax call log without all the riffraff, patched away noisy lines
#+TODO: Quiet option to reduce OPAL chatter, patched away
# TODO: Do we get disconnect and reconnect on Internet failover?
#+TODO: Do not show password on command line, patched to show length
#+TODO: Do not show password on screen in systemd log, patched to read from file
# TODO: How to set up redundant connections
#+TODO: Delete /dev/ttyT* on exit, handled by watchdog
# TODO: --rtp-max must always be odd number

_sipext=''
#_sipsvr='sip.t38fax.com:5080'; _sipext=''
#_sipsvr='voip.itsp.net:5060'; _sipext='ttyAC'
#@SIPSVR@

# Until patch 0001 is fixed, we need a separate package for each service
# Patch 0001 is now fixed. No more need for separate package.

# Edit /etc/t38modem.sh with service parameters
# Passwords should not have any special characters that interfere with sed !#_-= are ok
# Password is gone, no longer removed by sed.

# For first service
# systemctl enable --now t38modem

# For additional service
# systemctl enable --now t38modem@ttyAC

# Use the watchdog if you find t38modem hangs. Some crashes are restarted by systemd and some hang.
# systemctl enable --now t38modem-watchdog.timer
# systemctl enable --now t38modem-watchdog@ttyAC0.timer

# In your router create UDP port mappings for UDP+RTP ports. Source lock them to your provider static IP.
# Set the ttl to 100 more seconds than $g_sip_expires (t38modem.sh)
# Verify that the TTL is correct

set -u
_pkgname='t38modem'
pkgname="${_pkgname}${_sipext}"
#pkgname+='-git'
pkgver='4.6.2'
_opalver='3.18.8'
_pkgver="${pkgver%%.r[0-9]*}"
pkgrel=1
pkgdesc='t.38 SIP VoIP fax modem for Hylafax'
arch=('x86_64')
#url="https://github.com/T38Modem/${_pkgname}"
url='https://github.com/hehol/t38modem' # Henning Holtschneider
#url='http://t38modem.sourceforge.net/' # Pete Davidson
license=('MPL-1.0')
depends=('gcc-libs' 'bash' 'glibc' "opal>=${_opalver}" 'ca-certificates-utils' 'procps-ng' 'ptlib')
depends+=('curl')
# opal will determine the required version of ptlib
makedepends=('pkg-config')
backup=('etc/t38modem.sh')
_srcdir="${_pkgname}-${_pkgver}"
options=('!buildflags')
install="${_pkgname}-install.sh"
source=(
  "${_srcdir}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  '0000-t38modem-perms-uucp.patch'
  # Error: Call failed due to a transport error https://github.com/hehol/t38modem/issues/6
  #'0001-t38modem-t38fax-routing-support.patch'
  # Patch 0002-opensuse-0001 was modified to remove an invalid code change.
  '0002-opensuse-0001-build-resolve-compiler-warnings-and-errors-with-ptli.patch' # https://build.opensuse.org/package/show/openSUSE:Factory/t38modem
  #'0003-disable-log-password.patch'
  '0004-password-from-file.patch'
  #'0005-privileges-uucp.patch' # Patch doesn't work
  '0006-quiet-output.patch'
  't38modem.sh'
)
md5sums=('ca9e2ceb352c70c99aa0defda2b9075a'
         '6dff05fdc3dec8b4461cd87ad115814c'
         'ff9e1a8aa228a442be46b41ceb0b9e42'
         '5532b59034c3e3c84057baa205fef98d'
         '11c092eeb9a04e0fe481a656c8b869bc'
         '82e781af4df81864a84e21d725eac562')
sha256sums=('d44069fa0e10fda9d91c79c5a74db1b26926c60b88a39553398a1c79b2ae412f'
            '22d84d09399fb89925c006b0c17a4b80d56c7ba4f60a27e4c206d6280ef6b064'
            'b6166a32a57a006181b3951dc83b3dbbbffebd11bc57983e6dc2a7d341c26f97'
            'ada520832077f6f9a8d107e3abce9f8cab754c89e59bdabd9c9c4dc7f267e97e'
            '73c4c20d47a763c45dce442f2844b22246e2bf1eccfa846e10fd7ea8bf2379e4'
            '10bcd8799f62ba47efe79f3221767da8fca6921d7b298ce72ab79ddca7de7596')

_g_uid='uucp'
_g_gid='uucp'

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _srcdir="${_pkgname}"
  source[0]="${_srcdir}::git+${url}.git"
  #source[0]+="#branch=${_pkgverb}"
  makedepends+=('git')
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  provides=("${_pkgname}=${_pkgver}")
  conflicts=("${_pkgname}")
pkgver() {
  set -u
  cd "${_srcdir}"
  local _gver
  _gver="$(git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g')"
  local _clver="$(grep -m1 -hE -e '^[0-9.]{5}[^ ]* +--' 'ChangeLog')"
  _clver="${_clver%% *}"
  if [ ! -z "${_clver}" ] && [ "$(vercmp "${_clver}" "${_gver}")" -gt 0 ]; then
    printf '%s.r%s' "${_clver}" "${_gver##*.r}"
  else
    printf '%s' "${_gver}"
  fi
  set +u
}
elif [ "${_pkgver}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${_pkgver}"
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  local _nver="$(grep -e 'Incompatible OPAL version' 'opal/modemep.h' | grep -Eoe '[0-9\.]+')"
  if [ "$(vercmp "${_nver}" "${_opalver}")" -gt 0 ]; then
    printf '_opalver needs to be updated to at least %s\n' "${_nver}"
    set +u
    false
  fi

  shopt -s nullglob
  # https://sourceforge.net/p/opalvoip/mailman/opalvoip-user/thread/AC931B7D-293F-4582-B873-69B0F5887EF0%40loca.net/#msg33202409
  local _fl=(/usr/lib/opal-*/fax/spandsp_ptplugin.so)
  if [ "${#_fl[@]}" -eq 0 ]; then
    echo 'opal must be compiled with spandsp plugin'
    set +u
    false
  fi
  shopt -u nullglob

  local _seds=(
    -e "s:@UUCP@:$(getent group "${_g_gid}" | cut --delimiter ':' --fields 3):g"
    #-e "s/@SIPSVR@/${_sipsvr}/g"
  )

  local _f
  for _f in "${source[@]}"; do
    _f="${_f%%::*}"
    _f="${_f##*/}"
    if [[ "${_f}" = *.patch ]]; then
      set +u; msg2 "Patch ${_f}"; set -u
      patch -Nup1 -i <(sed -E "${_seds[@]}" "${srcdir}/${_f}")
    fi
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > 'new.patch'

  # Disable H323 compile which is no longer used
  sed -e 's:opal/h323ep.o::g' -i 'Makefile'

  bash -n "${srcdir}/t38modem.sh"

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  CFLAGS+=' -Wno-narrowing'
  #CFLAGS+=' -Wno-deprecated-declarations' # Need this until auto_ptr fixed in opal
  CXXFLAGS+=' -std=c++17'
  #CXXFLAGS+=' -std=c++03'
  nice make # -j1 # CXX='g++-9' CC='gcc-9' # too small, debugging is easier with -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dp 't38modem' "${pkgdir}/usr/bin/t38modem${_sipext}"

  if [ ! -z "${_sipext}" ];then
    depends+=('t38modem')
  else
    install -Dpm700 "${srcdir}/t38modem.sh" -t "${pkgdir}/etc/"

    install -dm770 "${pkgdir}/var/log/t38modem"

    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=${pkgdesc}
After=network.target

[Service]
Type=simple
Restart=always
#RestartSec=30
Nice=-10
ExecStartPre=+/etc/t38modem.sh -T %I -F prep
ExecStart=/etc/t38modem.sh -T %I
ExecStopPost=+/etc/t38modem.sh -T %I -F cleantty
User=${_g_uid}
Group=${_g_gid}

[Install]
WantedBy=multi-user.target
EOF
    ) "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
    sed -e 's: -T %I::g' "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service" > "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=Watchdog for t38modem crashes

[Timer]
OnCalendar=*-*-* *:0/15:05
Persistent=false

[Install]
WantedBy=multi-user.target
EOF
    ) "${pkgdir}/usr/lib/systemd/system/${_pkgname}-watchdog@.timer"
    cp -p "${pkgdir}/usr/lib/systemd/system/${_pkgname}-watchdog@.timer" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-watchdog.timer"

    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Unit]
Description=Watchdog launcher for t38modem crashes
After=network.target
#ConditionFileNotEmpty=/tmp/devt38modem/t38modem.watchdog.ttyT.txt

[Service]
Type=oneshot
ExecStart=/etc/t38modem.sh -T %I -F watchdog
EOF
    ) "${pkgdir}/usr/lib/systemd/system/${_pkgname}-watchdog@.service"
    sed -e 's: -T %I::g' "${pkgdir}/usr/lib/systemd/system/${_pkgname}-watchdog@.service" > "${pkgdir}/usr/lib/systemd/system/${_pkgname}-watchdog.service"
  fi
  set +u
}

set +u
