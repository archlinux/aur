# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Yakir Sitbon <kingyes1 at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Stas S <whats_up at tut dot by>
# Contributor: Hilinus <itahilinus at hotmail dot it>

# Multilib is required. Wine is not required.

# TODO: Does not autostart with startxfce4. Maybe it works with gdm.

# Test requirements, [X]=pass for most versions, [x]=pass for some versions, ?=not tested
# [X] Works in i686 and x86_64
# [X] Outgoing connections
# [X] Incoming and swap connection on manual start
# [x] Auto start and accept connections in text mode
# [ ] Auto start and accept connections in graphics mode startxfce4
# [?] Auto start and accept connections in graphics mode gdm
# [ ] Transfer control from text TV server to graphics TV server when GUI is loaded startxfce4, requires auto start
# [ ] Transfer clipboard

set -u
pkgname='teamviewer9'
#pkgver=8.0.20931
pkgver=9.0.32150
#pkgver=10.0.35002
#pkgver=10.0.36281
#pkgver=10.0.37742
#pkgver=10.0.41499
#pkgver=10.0.46203 # Patched to work in user (standalone) mode. Does not work with teamviewerd.service.
#pkgver=11.0.50678
#pkgver=11.0.52520
#pkgver=11.0.53191
pkgrel=1
_pkgver_major="${pkgver%%.*}"

if [ "${pkgname%-quicksupport}" != "${pkgname}" ]; then
  _tvdir="teamviewer${_pkgver_major}qs"
  _opt_QuickSupport=1
else
  _tvdir="teamviewer${_pkgver_major}"
  _opt_QuickSupport=0
fi

# Both TeamViewer and TeamViewerQS operate in two modes. If you extract the files to a HOME folder
# and just run teamviewer, it will self start a user mode network process to support the gui tool.
# Watch for 'Starting network process (no daemon)' in the console window.
# If you install TeamViewer, the GUI tool expects to attach to it. TeamViewer
# attaches to the service you start as root and TeamViewerQS attaches to an invisible service
# that self starts as non root.

# Self Start: teamviewerd -n -f
# Service:    teamviewerd -d

# The TeamViewer service in 10.0.46203 is broken under Arch Linux. This broke both
# TeamViewer and TeamViewerQS. This shows that TeamViewerQS has a server mode even though
# the server file is invisible and the service can only launch as non root.

# To fix TeamViewerQS we change the scripts so even while installed, QS will start in user mode.
# Since TeamViewerQS cannot be set for permanent startup, there was never a reason to have a
# server mode for TeamViewerQS.

# Others have noted that the non QS .tar.gz download works fine and believe that it is different.
# It isn't different. All downloads are the same except for the per-OS dependencies. What changes
# is that isInstalledTV detects you're running from a user folder and autostarts the user mode
# network process. This mode still works. Unfortunately you lose the ability to autostart
# for incoming connections which is the whole reason why we use the Linux version of TeamViewer.
# Otherwise you could just install TeamViewer for Windows into Wine or a VM.

# To fix TeamViewer we make the scripts detect whether the service has been loaded and load
# the user mode networking or attach to the service as necessary.

# The TeamViewer service works in the Debian Jessie Live ISO i386 and amd64 so the problem should be fixable.
# Until a fix is found we either don't enable the service or go back to 41499.

# TeamViewer has a different configuration between standalone and service. Try this to reset:
#   sudo systemctl stop teamviewerd.service
#   sudo rm -f /opt/teamviewer10/config/global.conf
#   mkdir ~/.config/teamviewer10/config
#   optional: sudo systemctl start teamviewerd.service

# To get started fixing, search the logs for
# systemd: no active session found for display :0, assuming login screen

# I don't use a login screen. I use startxfce4.

# -CJS 2015-09-25

pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('i686' 'x86_64')
url='http://www.teamviewer.com'
license=('custom')
depends=('bash')
depends_i686=('alsa-lib' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'libice' 'libsm' 'libxdamage' 'libxrandr' 'libxtst' 'pcre' 'zlib' 'libxinerama' 'libpng12' 'qt4')
# From Debian: 'libjpeg6-turbo' 'expat' 'libxau' 'libxdmcp' 'libxcb' 'libx11' 'libxfixes' 'libxext' 'libxrender' 'libxi' 'libxtst' 'util-linux'
depends_x86_64=("${depends_i686[@]/#/lib32-}")
provides=("teamviewer=${_pkgver_major}")
conflicts=('teamviewer')
options=('!strip')
install="${pkgname%%[0-9]*}.install"
_verwatch=('https://www.teamviewer.com/en/download/linux.aspx' '\s\+<span id="_ctl2_Version">v\([0-9\.]\+\)</span>.*' 'f')

if [ "${_pkgver_major}" -ge 10 ]; then
  source=("http://download.teamviewer.com/download/version_${_pkgver_major}x/teamviewer_${pkgver}.i686.rpm")
else
  source=("teamviewer_${pkgver}.i686.rpm::http://download.teamviewer.com/download/version_${_pkgver_major}x/teamviewer_linux.rpm")
fi
sha256sums=('12f00b1dff5e4fc2f49b50dd1e76a7c9fc6920f5d524a2d96879f0bfdc415aa7')
PKGEXT='.pkg.tar.gz'

# There are 4 Linux downloads. The files and folder structure are all the same. The only difference is packaging and dependencies.
# Debian MultiArch
# Debian i386
# RPM
# tgz
# The DEB is the worst. There are 3 different versions, though to Arch they are all the same.
# The RPM is the easiest to work with. It unpacks automatically, there's only one arch, and all the folders are set up.

# The Linux QuickSupport has some different binaries to enable a built in server. Also includes libs.

# Keep this at zero. While private logging is functional, the logs don't log anything
# and there might be other problems.
_opt_PRIVATELOG=0

prepare() {
  [ -d 'opt' ] && cd 'opt'
  if [ -d 'teamviewer' ] && [ ! -d "${_tvdir}" ]; then
    mv 'teamviewer' "${_tvdir}"
  fi
  cd 'teamviewer'*/

  if [ -s 'tv_bin/archive.tar.xz' ] && pushd 'tv_bin' >/dev/null; then
    msg2 'Extracting QuickSupport archive'
    bsdtar -xf 'archive.tar.xz'
    rm -f 'archive.tar.xz'
    popd >/dev/null
  fi

  set -u
  sed -i -e 's:/var/run/:/run/:g' 'tv_bin/script/teamviewerd.service'

  # Fix paths in the systemd service file, not used in QuickSupport.
  sed -i -e "s:/opt/teamviewer/:/opt/teamviewer${_pkgver_major}/:g" 'tv_bin/script/teamviewerd.service'

  # remove some trash. This is mostly to antagonize the scripts if they decide to run the wrong thing.
  rm -rf 'tv_bin/RTlib/'
  rm -f 'tv_bin/xdg-utils/xdg-email'
  rm -f 'tv_bin/script/teamviewerd.'{RPM,DEB}.conf 'tv_bin/script/teamviewerd.sysv' 'tv_bin/script/tv-delayed-start.sh' 'tv_bin/TeamViewer' 'tv_bin/desktop/teamviewer.desktop.template'

  # This makes checklibs run better
  find -type f -name '*.so*' -exec chmod 755 '{}' ';'

  # fix some CRLF line endings
  sed -i -e 's:\r::g' doc/*

  # This runs Explorer instead of TeamViewer so you can look around.
  #sed -i -e 's:^\(\s\+exec wine\) "[^"]\+":\1 "explorer.exe":g' 'tv_bin/script/tvw_main'

  sed -i -e '# duh?! This is far too complicated to allow it to self update.' \
         -e '/UpdateBinaries/s/^/#/' \
         -e '# This crashes on startup for a path that already exists' \
         -e '#s:^\(\s*make_path "$TV_LOG_DIR"\):#&:g' \
    'tv_bin/script/tvw_main'

  # Clean up the installer. Mostly fluff!
  sed -i -e '# Make the script highlight correctly in Midnight Commander mcedit' \
         -e 's:^TV_SCRIPT_DIR=.*$:& # ":g' \
         -e '# Disable install, for the curious that must try everything once... like me!' \
         -e 's:^TVSetup :function InstallTar() { echo "Use pacman to install, update, and remove TeamViewer QuickSupport"; }\n&:g' \
         -e '# They renamed the file from tv_setup and forgot to correct the contents' \
         -e 's:tv-setup :teamviewer_setup :g' \
    'tv_bin/script/teamviewer_setup'

  if [ "tv_bin/desktop/teamviewer-teamviewer${_pkgver_major}.desktop" != "tv_bin/desktop/teamviewer-${_tvdir}.desktop" ]; then
    mv "tv_bin/desktop/teamviewer-teamviewer${_pkgver_major}.desktop" "tv_bin/desktop/teamviewer-${_tvdir}.desktop"
  fi

  sed -i -e '# set correct path in many files' \
         -e "s|/opt/teamviewer/|/opt/${_tvdir}/|g" \
    "tv_bin/desktop/teamviewer-${_tvdir}.desktop" $(grep -rlIF '/opt/teamviewer/' 'tv_bin/script/')

  if [ "${_opt_PRIVATELOG}" -ne 0 ]; then
    sed -i -e 's:^\(\s\+TV_LOG_DIR\)=.*$:&\nmkdir -p "${TV_LOG_DIR}":g' 'tv_bin/script/tvw_config'
  fi

  sed -i -e '# set correct path for QS' \
         -e 's:^\(\s*TV_INSTALL_BASE_DIR\)=.*$'":\1=/opt/${_tvdir}:g" \
         -e "# Arch Linux lib locations are different than Redhat." \
         -e "# This has no effect on TeamViewerQS but it fixes incoming connections for TeamViewer>=10.0" \
         -e "#s:^\(TV_LD32_PATH\)='/lib/:\1='/usr/lib32/:g" \
         -e "#s:^\(TV_LD64_PATH\)='/lib64/:\1='/usr/lib/:g" \
         -e '# QuickSupport wants to place profiles in /opt/teamviewer##/profiles but' \
         -e '# Wine requires that the launching user owns the folder. The first' \
         -e '# user to use TeamViewer will block the rest out' \
         -e "# so we make QS use the user's home folder." \
         -e "# Making everyone use /opt/teamviewer##/{config,logfiles,profile} must be made unsafe to get it functional." \
         -e "# I don't see how their setup could work on any of their supported platforms." \
         -e 's:^\(\s\+TV_PROFILE\)=.*$:\1="$HOME/.config/'"${_tvdir}"'" # &:g' \
         -e '#s:^\(\s\+TV_LOG_DIR\)=.*$:\1="$TV_BASE_DIR/logfiles":g' \
         -e '#s:^\(\s\+TV_CFG_DIR\)=.*$:\1="$TV_BASE_DIR/config":g' \
    'tv_bin/script/tvw_config'

  #sed -i -e '# More attempts to disable the server' \
  #       -e 's:$TV_BASE_DIR/config/global.conf:$TV_CFG_DIR/global.conf:g' \
  #  'tv_bin/script/tvw_extra' 'tv_bin/script/tvw_profile'

  # Disable the automatic Network Process if the service is running. For TeamViewerQS the service is never active.
  sed -i -e '/function isInstalledTV/,/^}$/c function isInstalledTV() { systemctl -q is-active "teamviewerd.service"; }' 'tv_bin/script/tvw_aux'
  # This also allows checklibs to run from the src folder.
  echo 'function isInstalledTV() { return 1; } #TeamViewerArchLinux' >> 'tv_bin/script/tvw_aux'

  # It's quite tricky to keep QS from detecting that TV is installed so that QS can run in standalone mode.
  sed -i -e '/function SetupEnv/,/^}$/c function SetupEnv() { :; }' 'tv_bin/script/tvw_profile'

  local _lf=$'\n'
  local _tvcode="
# This is used by the installer to know which folder to remove
#_opt_TVDIR=${_tvdir}
#_opt_TVPKGVER=${pkgver}
_opt_TVBINDIR=/opt/${_tvdir}/tv_bin
_opt_TVCONFIGDIR=/opt/${_tvdir}/config
_opt_QuickSupport=${_opt_QuickSupport} # Set by the PKGBUILD. QuickSupport only uses the 32 bit version.
#_opt_MajorVersion=${_pkgver_major}"'   # Needed by the installer
# Keep this from launching in a PuTTY window and the console.
if [ -z "${DISPLAY}" ]; then
  echo "No graphical DISPLAY. Try running TeamViewer from an X Terminal."
  exit 1
fi
# TeamViewerQS and TeamViewer 8.0 work without an .Xauthority file. Required for TeamViewer>=9.0.
if [ ! -s ~/".Xauthority" ]; then
  xauth generate :0 . trusted
fi
if killall -9 "TVGuiSlave.64" 2>/dev/null; then
  echo "Killing TVGuiSlave.64"
  sleep 1
fi
if killall -9 "TVGuiSlave.32" 2>/dev/null; then
  echo "Killing TVGuiSlave.32"
  sleep 1
fi
unset _opt_QuickSupport
'

  sed -i -e "s@^TV_SCRIPT_DIR=@${_tvcode//${_lf}/\\n}&@g" 'tv_bin/script/teamviewer'

  # New for TV11
  if [ -L 'logfiles' ]; then
    rm 'logfiles'
    mkdir 'logfiles'
  fi
  if [ -L 'config' ]; then
    rm 'config'
    mkdir 'config'
  fi
  set +u
}

check() {
  set -u
  [ -d 'opt' ] && cd 'opt'
  cd 'teamviewer'*/
  #if [ -L 'logfiles' ]; then
  #  mv 'logfiles' 'logfiles.Arch' # New in TV 11
  #  mkdir 'logfiles'
  #fi
  # The lib checker isn't well tested for TeamViewerQS
  cd 'tv_bin'
  [ -f 'TVGuiSlave.64' ] || ln -s '/usr/bin/true' 'TVGuiSlave.64'
  [ -f 'TVGuiDelegate' ] || ln -s '/usr/bin/true' 'TVGuiDelegate'
  cd 'script'
  set +u
  if [ "${_pkgver_major}" -eq 8 ]; then
    cp -p 'tvw_config' 'tvw_config.Arch'
    sed -i -e 's:^\(\s\+TV_LOG_DIR\)=.*$:\1="/tmp":g' \
      'tvw_config'
  fi
  if grep -ql -- '--checklibs' 'teamviewer_setup'; then
    local _checklibs='--checklibs'
  else
    local _checklibs='checklibs'
  fi
  if ! ./teamviewer_setup "${_checklibs}" > '/tmp/teamviewer-PKGBUILD.tmp'; then
    ./teamviewer_setup "${_checklibs}"
  fi
  cat '/tmp/teamviewer-PKGBUILD.tmp'
  # 9.0.32150 shows a bogus dependency on libwine.so.1
  # 10.0.35002 beta shows a bogus dependency on libwine.so.2
  if [ "${pkgver}" != '10.0.35002' ] && [ "${pkgver}" != '9.0.32150' ] && grep 'missing' '/tmp/teamviewer-PKGBUILD.tmp'; then
    rm -f '/tmp/teamviewer-PKGBUILD.tmp'
    false
  fi
  rm -f '/tmp/teamviewer-PKGBUILD.tmp'
  if [ -f 'tvw_config.Arch' ]; then
    mv 'tvw_config.Arch' 'tvw_config'
  fi
  cd ..
  [ ! -L 'TVGuiSlave.64' ] || rm -f 'TVGuiSlave.64'
  [ ! -L 'TVGuiDelegate' ] || rm -f 'TVGuiDelegate'
  cd ..
  rm -f 'logfiles'/*.log
  #if [ -L 'logfiles.Arch' ]; then
  #  rm -rf 'logfiles'
  #  mv 'logfiles.Arch' 'logfiles' # New for TV 11
  #fi
}

package() {
  set -u
  if [ "${_opt_QuickSupport}" -ne 0 ]; then
    cd 'teamviewer'*/
    install -d "${pkgdir}/opt/${_tvdir}/"
    mv * "${pkgdir}/opt/${_tvdir}/"
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_tvdir}/tv_bin/script/teamviewer" "${pkgdir}/usr/bin/quicksupport"
    cd "${pkgdir}/opt/teamviewer"*/
    # Label the icon correctly
    sed -i -e 's:^Name=.*$:& QuickSupport:g' "tv_bin/desktop/teamviewer-${_tvdir}.desktop" #"tv_bin/desktop/teamviewer.desktop.template"
  else
    mv 'etc' 'opt' 'usr' 'var' "${pkgdir}"
    #mv 'opt' 'usr' "${pkgdir}"
    cd "${pkgdir}/opt/teamviewer"*/
    install -Dpm644 "tv_bin/script/teamviewerd.service" "${pkgdir}/usr/lib/systemd/system/teamviewerd.service"
    install -d "${pkgdir}/usr/bin"
    sed -i -e 's:^.*#TeamViewerArchLinux$::g' 'tv_bin/script/tvw_aux'
  fi
  # We don't allow TV and QS installed at the same time so we create both executables.
  ln -sf "/opt/${_tvdir}/tv_bin/script/teamviewer" "${pkgdir}/usr/bin/teamviewer"

  # Without this QS claims that the server isn't running. It sounds wrong since QS uses its built in server unless TV is installed.
  # The real answer is that all pidfiles are created there and the inability to create a pidfile triggers the message.
  # There's no reason to have both so the Arch packages are set up so QS and TV can't be installed at the same time.
  # There is evidence of private config folders in the tvw_config but I coudldn't get them to work. This might be because
  # I was deleting the config folder in /opt which is needed for the pid files. Still though a private config
  # doesn't make sense since many of the scripts are hardcoded to the /opt folder. Sounds not well tested to me.
  chmod 1777 'config'

  if [ "${_opt_PRIVATELOG}" -ne 0 ]; then
    rmdir 'logfiles'
  else
    # Each user creates core and stack files here.
    chmod 1777 'logfiles'
    install -pm666 /dev/null 'logfiles/TeamViewer10_Logfile.log'
    install -pm666 /dev/null 'logfiles/startup.log'
  fi

  install -d "${pkgdir}/usr/share/applications"
  ln -sf "/opt/${_tvdir}/tv_bin/desktop/teamviewer-${_tvdir}.desktop" "${pkgdir}/usr/share/applications/teamviewer.desktop"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf "/opt/${_tvdir}/doc/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # /var isn't found anywhere in the files so there's no reason to have these folders.
  #install -d "${pkgdir}/var/lib/"
  #ln -sf "/opt/${_tvdir}/config" "${pkgdir}/var/lib/teamviewer"
  #install -d "${pkgdir}/var/log"
  #ln -sf "/opt/${_tvdir}/logfiles" "${pkgdir}/var/log/teamviewer"
  set +u
}
set +u
