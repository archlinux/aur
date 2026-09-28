# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=s32-design-studio
pkgver=3.6.10
pkgrel=1
pkgdesc="IDE for editing, compiling, debugging and flashing NXP S32 designs (Kinetis, LPC, S32K, S32G, SAF)"
arch=('x86_64')
url="https://www.nxp.com/design/design-center/software/automotive-software-and-tools/s32-design-studio-ide:S32-DESIGN-STUDIO-IDE"
# The vendor binaries are shipped as they are: the cross toolchains, the
# bundled gdb and the S32 debugger need the symbol and debug information that
# makepkg would remove, and repackaging them is not this package's business.
# The libtool and staticlibs options are inverted in makepkg (they enable the
# removal of the *.la and *.a files of the cross toolchain sysroots), so they
# are turned on here to keep them.
options=('!strip' '!debug' 'libtool' 'staticlibs')
# The product is proprietary; the EULA and the third party licenses NXP
# redistributes with it are installed in /opt/s32-design-studio/License.
license=('LicenseRef-NXP-S32DS-EULA')
depends=('alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libglvnd'
  'libnet'
  'libusb'
  'libusb-compat'
  'libx11'
  'libxext'
  'libxft'
  'libxi'
  'libxrender'
  'libxss'
  'libxtst'
  'libxxf86vm'
  'ncurses'
  'pango'
  'pcsclite'
  'xz'
  'zlib'
  'zstd')
optdepends=('gtk2: legacy JavaFX GTK2 backend shipped with the IDE'
  'python: python helpers of the S32 Debugger and of the PEmicro GDB client'
  'tcl: TCL scripts of the Project_Settings container'
  'dos2unix: unix2dos helper used by some project settings scripts')
# NXP ships the installer as a self extracting binary that is not downloadable
# without an nxp.com account, so it has to be placed next to this PKGBUILD (or
# fetched with your own account) before running makepkg.  It is 2.9 GB and
# needs roughly 20 GB of free space while it is being built.
installer="SW32_S32DS_${pkgver}_RFP_D2607_linux.$arch.bin"
source=("$installer::https://freescaleesd.flexnetoperations.com/337170/607/20142607/SW32_S32DS_3.6.11_RFP_D2609_linux.x86_64.bin?ftpRequestID=4480565751&server=freescaleesd.flexnetoperations.com&ext=.bin")
sha256sums=('4b4d760f0400080ba59d628f923d45bad936e066638d21862266ce4b154b2ed3')
# Reloads the udev rules of the debug probes after install, so they are usable
# without a reboot.  The installation itself is made writable in build(), see
# _allow_extension_installs(), so this scriptlet is only about udev.  makepkg
# only embeds it when it is declared here, the $pkgname.install of the start
# directory is not picked up implicitly.
install=s32-design-studio.install

_installdir="/opt/$pkgname"
_scratchdir="s32ds-build"

# $srcdir only exists once the PKGBUILD has been sourced and makepkg sources it
# again before package(), so no path is resolved at the top level and both
# functions have to ask for the layout of the scratch area themselves.
_stage_paths() {
  _builddir="$srcdir/$_scratchdir"
  _stage="$_builddir$_installdir/S32DS"
  _fakehome="$_builddir/home"
  _iatemp="$_builddir/ia-temp"
  _sandbox="$_builddir/bin"
}

# The vendor installer is an InstallAnywhere 22 self extractor.  A few of its
# actions cannot be influenced from the response file, so the installer is run
# inside a sandbox that keeps every side effect inside the build directory:
#
#   * IATEMPDIR/HOME/TMPDIR are redirected, otherwise ~2.9 GB are unpacked into
#     /tmp (or $HOME when /tmp is too small) and desktop entries are written to
#     the real home directory of the build user.
#   * A response file instead of the interactive panels, so the build is
#     reproducible.
#   * TYPICAL=0 plus explicit component switches.  With TYPICAL=1 the installer
#     forces INSTALL_PNE_DEBUGGER_DRIVERS and INSTALL_SEGGER_DRIVERS back to 1
#     and then runs `sudo ./inst_drivers_temp.sh`, which copies udev rules and
#     libraries into the running system.
#   * sudo, pkexec and friends are stubbed out as a second line of defence, in
#     case a future installer revision adds another privileged action.
_normalize_permissions() {
  local root=$1 f magic

  find "$root" -type d -exec chmod 0755 {} +
  while IFS= read -r -d '' f; do
    magic=
    read -r -N 16 magic < "$f" 2>/dev/null || true
    case $magic in
      # native binaries, shared objects and scripts keep their exec bit
      $'\177ELF'*|'#!'*) chmod 0755 "$f" ;;
      *) chmod 0644 "$f" ;;
    esac
  done < <(find "$root" -type f -print0)
}

# S32 Design Studio installs extensions into its own installation directory, and
# that is what the metadata of the NXP update site asks for.  Every extension
# pack carries instructions like
#
#   com.nxp.s32ds.ext.rcp.p2.native.install(source:@artifact,
#       target:${installFolder}/../S32DS/build_tools/gcc_v10.2,overwrite:true);
#
# which org.eclipse.equinox.internal.p2.touchpoint.natives.actions.CopyAction
# runs as mkdirs() of the parent of the target followed by a plain
# FileOutputStream on the target itself.  The first needs write permission on
# the directory, the second on a file that often already exists, so a tree that
# is read only for the user running the IDE fails with
#
#   Target: Path /opt/s32-design-studio/.../gcc-9.2-arm32-eabi could not be created
#
# for every toolchain, debugger, help and pack install.  Across the 28
# repositories of the update site all 512 path expressions resolve to
# S32DS/{build_tools,config,examples,help,integration,software,tools}, the
# S32DS directory itself and the p2 managed directories below eclipse, so the
# whole tree is made writable here.
#
# a+rwX rather than a dedicated group: the group would have to be created by an
# install scriptlet, since makepkg can only record ownership as numbers and the
# gid of a group that does not exist yet differs from machine to machine, and a
# group every user has to be added to is a step that is easy to forget and
# impossible to debug from the IDE.  NXP's own Linux image ships the
# installation world writable, chmod -R 777, for the same reason.  Ownership
# stays with root and nothing else in the package is touched.
_allow_extension_installs() {
  local root=$1

  # X only adds the execute bit to directories and to files that already have
  # one, so binaries stay executable and data files stay non-executable
  find "$root" -type d -exec chmod a+rwX {} +
  find "$root" -type f -exec chmod a+rw {} +
}

# NXP builds the product on a Jenkins agent and bakes the paths of that agent
# into the p2 metadata it ships.  The "Bundle pool", the download cache and the
# product repository registered in the preferences of the installation point at
# /opt/jenkins/..., and so do the 84 references inside the gzipped profile state
# (the profile property that holds the location of the download cache).  p2
# therefore does not see the ~1600 bundles that are already installed, goes
# looking for their artifacts in the update sites, and every extension install
# ends with
#
#   No repository found containing: binary,com.nxp.s32ds.brc.arm....
#
# because the update sites do not carry the exact versions that are installed.
# The build paths are replaced with the location of this package.  The target is
# a parameter so that the rewrite can be exercised outside of /opt.
_relocate_p2() {
  local target=$1 prefs profile build_pool build_repo
  local profiles="$_stage/eclipse/p2/org.eclipse.equinox.p2.engine/profileRegistry/DefaultProfile.profile"

  prefs="$_stage/eclipse/p2/org.eclipse.equinox.p2.engine/.settings/org.eclipse.equinox.p2.artifact.repository.prefs"

  # the product directory of the build agent and the repository it was built
  # from, read back out of the preferences of the installation (the URIs are
  # stored with the colon of the scheme escaped)
  build_pool=$(sed -n 's|.*uri=file\\:\(.*\)/eclipse/*$|\1|p' "$prefs" | head -n1)
  build_repo=$(sed -n 's|.*uri=file\\:\(.*target/repository\)/*$|\1|p' "$prefs" | head -n1)

  if [ -z "$build_pool" ] || [ -z "$build_repo" ]; then
    error "the build paths of the vendor p2 metadata are not in $prefs"
  fi

  # everything the build agent registered that this package can serve itself
  # becomes the shipped eclipse directory: it holds the bundle pool, the pool
  # metadata (artifacts.xml) and, once an extension has been installed, the
  # directories of the new artifact classes.  The repository the product was
  # built from is dropped instead, it is not part of the installation: NXP
  # ships the metadata of the product nowhere and a registered metadata
  # repository that cannot be loaded makes p2 refuse to install anything.
  for prefs in \
    "$_stage/eclipse/p2/org.eclipse.equinox.p2.engine/.settings/org.eclipse.equinox.p2.artifact.repository.prefs" \
    "$_stage/eclipse/p2/org.eclipse.equinox.p2.engine/.settings/org.eclipse.equinox.p2.metadata.repository.prefs"; do
    sed -i -e '/^repositories\/.*target_repository\//d' \
      -e "s|$build_pool|$target|g" -e "s|$build_repo|$target|g" "$prefs"
  done

  for profile in "$profiles"/*.profile.gz; do
    gzip -dc "$profile" |
      sed -e "s|$build_pool|$target|g" -e "s|$build_repo|$target|g" |
      gzip -9 > "$profile.new"
    mv "$profile.new" "$profile"
  done

  # The vendor ships the download cache of p2 as an empty directory.  p2 wants
  # to write there as its first action and the directory has to exist in a fresh
  # install, so it is put back if the payload does not have it.
  if [ ! -d "$_stage/eclipse/p2/org.eclipse.equinox.p2.core/cache" ]; then
    install -d "$_stage/eclipse/p2/org.eclipse.equinox.p2.core/cache"
  fi
}

build() {
  local tool

  cd "$srcdir"
  _stage_paths
  rm -rf "$_builddir"
  mkdir -p "$_stage" "$_fakehome/Desktop" "$_iatemp" "$_sandbox"

  for tool in sudo pkexec pkaction gksudo gksu kdesu xhost; do
    printf '#!/bin/sh\nexit 1\n' > "$_sandbox/$tool"
    chmod 0755 "$_sandbox/$tool"
  done

  cat > "$_builddir/installer.properties" <<-EOF
	INSTALLER_UI=silent
	UPGRADE_INSTALL=0
	USER_INSTALL_DIR=$_stage
	USER_HOME=$_fakehome
	DESKTOP=$_fakehome/Desktop
	USER_SHORTCUTS=$_fakehome/Desktop
	TYPICAL=0
	INSTALL_GCC=1
	INSTALL_PNE_DEBUGGER=1
	INSTALL_PNE_DEBUGGER_DRIVERS=0
	INSTALL_S32DEBUGGER=1
	INSTALL_S32DEBUGGER_DRIVERS=0
	INSTALL_SEGGER_DRIVERS=0
	EOF

  echo "Running the NXP installer"
  HOME="$_fakehome" \
  XDG_CONFIG_HOME="$_fakehome/.config" \
  XDG_CACHE_HOME="$_fakehome/.cache" \
  XDG_DATA_HOME="$_fakehome/.local/share" \
  TMPDIR="$_builddir" \
  IATEMPDIR="$_iatemp" \
  PATH="$_sandbox:$PATH" \
    sh "./$installer" -i silent -f "$_builddir/installer.properties" \
    > "$_builddir/installer.log" 2>&1 || {
      tail -n 40 "$_builddir/installer.log" >&2
      error "the NXP installer failed, see $_builddir/installer.log"
    }

  if [ ! -x "$_stage/eclipse/s32ds" ]; then
    error "the NXP installer did not produce $_stage/eclipse/s32ds"
  fi

  # pacman owns the lifecycle of the package, so the InstallAnywhere
  # uninstaller, its registry and its logs have no place in it.  A copy of the
  # install log is kept in the build directory, it is the only record of what
  # the installer did.
  find "$_stage/_S32 Design Studio for S32 Platform ${pkgver}_installation/Logs" \
    -type f -name '*.log' -exec cp {} "$_builddir/vendor-install.log" \; 2>/dev/null
  rm -rf "$_stage/_S32 Design Studio for S32 Platform ${pkgver}_installation"

  # The installer bakes its own installation directory into the launcher
  # configuration.  Only the java.library.path line refers to an absolute
  # path, the rest of s32ds.ini is relative to the eclipse directory.
  sed -i \
    "s|^-Djava.library.path=.*|-Djava.library.path=$_installdir/S32DS/cll/x64:$_installdir/S32DS/tools/S32Trace/bin:../S32DS/cll/x64:../S32DS/tools/S32Trace/bin|" \
    "$_stage/eclipse/s32ds.ini"

  # The vendor p2 metadata still points at the build agent of NXP, see
  # _relocate_p2().
  _relocate_p2 "$_installdir"

  # The installer runs `chmod a+rwx -R` over everything it unpacks.
  _normalize_permissions "$_stage"

  # and the IDE then installs extensions into the result, see
  # _allow_extension_installs().
  _allow_extension_installs "$_stage"
}

package() {
  _stage_paths

  # $srcdir and $pkgdir live in the same build directory, so the staging tree
  # is moved instead of copied.
  install -d "$pkgdir/opt"
  mv "$_stage" "$pkgdir$_installdir"

  install -Dm755 "$startdir/s32ds" "$pkgdir/usr/bin/s32ds"
  # installed executable on request: the entry point has to be a usable
  # regular file, not a symlink into /opt
  install -Dm755 "$startdir/s32-design-studio.desktop" \
    "$pkgdir/usr/share/applications/s32-design-studio.desktop"
  install -Dm644 "$startdir/60-s32-design-studio.rules" \
    "$pkgdir/usr/lib/udev/rules.d/60-s32-design-studio.rules"
  install -Dm644 "$pkgdir$_installdir/nxpicon.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/s32-design-studio.png"
  install -Dm644 "$startdir/LICENSE.PKGBUILD" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.PKGBUILD"
}
