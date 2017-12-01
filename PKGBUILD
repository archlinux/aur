# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Mark Taylor <skymt0@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: xduugu
# Category: system

# Recommended build command: makepkg -scCfi

# TODO: An option to install more of the ast toolchain. Which parts?
# TODO: /etc/skel as found in the RPM
# TODO: Do we need to include BSD licenses? Probably not.
# TODO: Verify this builds on i686
# TOFIX: AT&T et al need to add a copyright to the end of the ksh man page similar to the one on nmake.
# TOFIX: AT&T et al need to fix <YEAR>... in the BSD copyright.
# TOFIX: AT&T et al need to make fixes for the PKGBUILD patches.
# TOFIX: AT&T et al need to fix the build errors that happen after ksh.
# TOFIX: test wouldn't complete after 16 hours. This might be related to the
#        build errors after ksh.
# TOFIX: If ksh is to be a serious contender in the interactive shell game, ksh needs mc integration

# To build you must view and accept the EPL license agreement then insert the
# username and password from the EPL license page below. Using AT&T sources
# is necessary because the Debian sources won't build any more. The new sources 
# are hard enough to build.

[ ! -s 'PKGBUILD.local' ] && cat > 'PKGBUILD.local' << EOF
# http://www.kornshell.com/
#   _Software_
#   _The Official AT&T Release of KornShell 93_
#   ... _EPL license page_
# http://www2.research.att.com/~astopen/download/licenses/epl-1.0.html

###############################################################################
# Please visit the EPL License page for the username and password
_opt_EPLUSER=''
_opt_EPLPASS=''
_opt_EPLURL='http://www.research.att.com/sw/download'
_opt_InstallBETA=1  # Default: 1, 0 to build release version
_opt_InstallNMAKE=0 # Default: 0, 1 to Install nmake
###############################################################################
EOF
source 'PKGBUILD.local'

# This is a multi core build. It takes less than 3 minutes on a big processor 
# like my Intel Haswell E3-1245v3 with SAS drives! Watch it go in htop!
# My Celeron G530 with SATA drives at home wasn't even close!

# Use Debian-provided sources since original AT&T tarball requires
# license agreements.
#_debpkgver='93u+20120801'
#source=("http://ftp.de.debian.org/debian/pool/main/k/ksh/ksh_${_debpkgver}.orig.tar.gz" 'LICENSE')

# The Debian package is INIT.2012-08-01.tgz+ast-ksh.2012-08-01.tgz
# We build the latest INIT + ast-base

# If Arch distributed this as a binary then building from the Debian sources 
# would be fine. Build it once then wait until the next version. This is in 
# the Arch AUR so it must build any time someone wants it. The progression 
# of Linux soon renders static sources in the complex AT&T build environment 
# unable to build.

# To build we had to mix the beta INIT and the release or beta ast-base which
# neither the Debian source nor the AT&T downloader is capable of.

# The patches herein are simple clerical errors resulting from a complex build 
# environment failing to support Linux as well as we'd like. Others haven't
# found the errors becase they build ast-ksh instead of ast-base.

# An advanced PKGBUILD that uses (and abuses) all the features of the AT&T
# build system is the best way to keep up with the ever changing build 
# requirements. Building ast-base may also attract the attention of the AT&T 
# devs so that Linux support improves.

# Gentoo also builds on demand so if you have build problems, check for new
# tricks in their eBuilds.

set -u
pkgname='ksh'
pkgdesc="AT&T's Korn shell ksh93 nmake from ast-base"
arch=('i686' 'x86_64')
url='http://www.kornshell.com/'
license=('EPL' 'CPL') # When a new release replaces the 2012 version, CPL can be dropped. http://www2.research.att.com/~astopen/download/licenses/licenses.html
depends=('glibc')
makedepends=('binutils') # for ar to unpack debian package
conflicts=('pdksh') # I'm not sure why this is a conflict! There are many ksh clones. Why aren't they all in conflict?
install='ksh.install'
#_verwatch=('http://www2.research.att.com/~astopen/cgi-bin/download.cgi?action=list&name=ast-base' '&nbsp;\([0-9-]\+\)&nbsp;&nbsp;BASE&nbsp;' 't')

# URL encoding, the sleazy way for the few characters we need!
_opt_EPLUSERE="${_opt_EPLUSER// /%20}"
_opt_EPLUSERE="${_opt_EPLUSERE//\//%2F}"
_debfile='ksh_93u+20120801-1_amd64.deb' # We don't want the binaries so the arch doesn't matter.

declare -f srcinfo_write_from_pkgbuild >/dev/null && { _opt_EPLUSERE=''; _opt_EPLPASS=''; } # erase pw for mksrcinfo, let through for makepkg

if [ "${_opt_InstallBETA}" -ne 0 ]; then
pkgver='2014.06.25beta'
pkgrel='1'
source=("http://${_opt_EPLUSERE}:${_opt_EPLPASS}@www2.research.att.com/~astopen/download/beta/INIT.2014-12-24.tgz"
        "http://${_opt_EPLUSERE}:${_opt_EPLPASS}@www2.research.att.com/~astopen/download/beta/ast-base.2014-06-25.tgz"
        "http://http.us.debian.org/debian/pool/main/k/ksh/${_debfile}" # man page and misc files
)

source[1]="ast-base.2014-06-25.tgz::https://github.com/nathanmkaya/ksh-arch/blob/master/ast-base.2014-06-25.tgz?raw=true"

# :; is to keep updpkgsums from removing all our sums
:;sha256sums=('8852b9d37d5034e3780aeb5f963726381eeb4e08bb5bee1fbfa7e3f529c10e1b'
            '58588b07b076f05dbbd5f4f095d5753309a8356ba1e5475262ce77d6bff42dae'
            '37495cc625a2174b22a43542acac1d69402ee4992ee084a84690546c5b932b39'
            '9cfd9a549ed8913e9edc98a6e596c441d2538f145f8c4711ad3d46ce79fa104e')
else
pkgver='2012.08.01'
pkgrel='5'
#source=("http://${_opt_EPLUSERE}:${_opt_EPLPASS}@www2.research.att.com/~astopen/download/tgz/INIT.2013-05-24.tgz"
source=("http://${_opt_EPLUSERE}:${_opt_EPLPASS}@www2.research.att.com/~astopen/download/beta/INIT.2014-12-24.tgz"
        "http://${_opt_EPLUSERE}:${_opt_EPLPASS}@www2.research.att.com/~astopen/download/tgz/ast-base.2012-08-01.tgz"
        "http://http.us.debian.org/debian/pool/main/k/ksh/${_debfile}" # man page and misc files
)
source[1]="http://download.openpkg.org/components/cache/nmake/ast-base.2012-08-01.tgz"
:;sha256sums=('8852b9d37d5034e3780aeb5f963726381eeb4e08bb5bee1fbfa7e3f529c10e1b'
            '3bd668dbd922790f1d24c78e3522ef4816501e9cf80abf3c480f554c74f4dbac'
            '37495cc625a2174b22a43542acac1d69402ee4992ee084a84690546c5b932b39'
            '9cfd9a549ed8913e9edc98a6e596c441d2538f145f8c4711ad3d46ce79fa104e')
fi
source[0]="INIT.2014-12-24.tgz::https://github.com/nathanmkaya/ksh-arch/blob/master/INIT.2014-12-24.tgz?raw=true"
source+=('bz1477082.patch') # https://github.com/att/ast/pull/63 https://bugzilla.redhat.com/show_bug.cgi?id=1477082
# makepkg unpacking deb files into the src folder isn't particularly useful.
noextract=("${_debfile}")

# Build Notes.
# This AT&T package builds itself up from the few crude tools supplied in INIT
# and the sources in ast-base. The general progression is
# INIT bin/package -> iffe + mamake + early tools and libs -> nmake
# -> late tools & libs -> ksh -> test
# Each step builds the tools needed to progress to the next step. 

# Their general build technique is to make modified copies of select sources 
# in src to arch. gcc -I- is used to sub in the modified copies. Each 
# target like ksh can use the same src files by making different changes 
# to them then using gcc -I- to sub in the changes. With -I- deprecated
# in 2005 and yet in 2015 it still hasn't been removed gives you an idea of
# how much work it is to fix the build environment to use -iquote, to say
# nothing of the platforms where -I- is still available. Rather than move 
# to -iquote it seems that AT&T et al are just hacking the build so select
# sources compile with or without -I-.

# sed hacking sources in arch/ generally doesn't work because they don't exist
# before the make and they are generated at the time they are used. I had to 
# use chattr +i to lock arch/ sources to test changes for effectiveness then 
# figure out how to make those changes over in the src files that are 
# available before the build starts and not modified during the build.

# Had I not found ways to do that I'd need to let the make crash, fix the
# file in arch, spirit away the src file so it can't be generated again, 
# then restart the make.

# Hopefully if I document some things future maintainers won't need to spend
# so much time learning the AT&T build system to fix builds.

# The release ast-base will build with the beta INIT. This PKGBUILD can do that
# but you won't be able to trick bin/package into making this combination. 
# From this success I can tell:

# INIT adapts to the ever advancing environments, including Linux.
# ast-base moves forwards as they improve the code.

# Release file sizes: 2012.08.01
# 1543096 2015-06-06 03:30 usr/bin/shcomp
# 1547192 2015-06-06 03:30 usr/bin/ksh

# Beta file sizes: 2014.06.25beta
# 2012304 2015-06-06 03:35 usr/bin/shcomp
# 2008208 2015-06-06 03:35 usr/bin/ksh

# I didn't see enough source diffs to justify a 4th larger binary. Maybe it's
# debug code. Announcements on the ast lists indicate that the improvements
# are pretty substantial in the direction of keeping ksh in the game as an
# interactive shell. This seems useful mainly in environments that use ksh
# as their primary shell as the future is grim for any shell wanting to
# unseat zsh as the best interactive shell.

# -CJS

# Return sorted list of all version numbers available (used by git-aurcheck)
_vercheck_disabled() {
  curl -s -l "${_verwatch[0]}" | grep -FB1 '>SOURCE<' | _getlinks "${_verwatch[2]}" | sed -ne "s:^${_verwatch[1]}"'$:\1:p' | tr '.' ':' | LC_ALL=C sort -n | tr ':' '.' # 1>&2
}

prepare() {
  set -u

  # makepkg just dumps the deb file directly into the src folder. This wouldn't
  # work if we needed 2 DEB files. We unpack what we want into a sane
  # folder name.
  # Unpack Debian file. No binaries needed, mostly package QC and the ready
  # made shcomp man pages.
  mkdir -p "${srcdir}/debian"
  cd "${srcdir}/debian"
  # http://www.g-loaded.eu/2008/01/28/how-to-extract-rpm-or-deb-packages/
  ar p "../${_debfile}" 'data.tar.gz' | tar zxf -
  cd "${srcdir}"

  # Interesting, but too old to be of much help.
  # http://www.linuxfromscratch.org/blfs/view/6.3/postlfs/ksh.html

  # These were the least unhelpful instructions. This full featured PKGBUILD
  # can now serve as the complete build and install instructions for ksh.
  # http://www2.research.att.com/~astopen/download/gen/SOURCE.html

  # Make package authorize/read use our persistent downloads rather than 
  # downloading again.
  #mkdir -p 'lib/package/tgz'
  #cp -pn *.tgz 'lib/package/tgz/'
  # This unpacks the packages we just placed
  # sh bin/package read

  # These are here to show alternate ways to get the packages. INIT is 
  # automatically downloaded as a dependency. We don't do this because:
  # * The PKGBUILD downloads persist when we wipe the src folder.
  # * We can guarantee that the package name always matches the content.
  # * We can mix the beta INIT with the release ast-base.
  if [ "${_opt_InstallBETA}" -ne 0 ]; then
    : # sh bin/package authorize "${_opt_EPLUSER}" password "${_opt_EPLPASS}" quiet setup beta "${_opt_EPLURL}" ast-base
  else
    # This likely worked in 2013 but on Arch as of June 2015 it is no longer 
    # feasible to get any release to compile with INIT.2013-05-24.
    : # sh bin/package authorize "${_opt_EPLUSER}" password "${_opt_EPLPASS}" quiet setup source "${_opt_EPLURL}" ast-base
  fi

  # Arch typically does not have a /usr/tmp. My system happens to because of 
  # another bum package. Gentoo also patched this.
  # The grep nonsense is so we don't needlessly change the timestamp of 
  # already fixed files. Helpful for running makepkg -ef over and over.
  #sed -i -e 's:/usr/tmp:/tmp:g' 2>/dev/null `grep -l '/usr/tmp' 'src/cmd/nmake/Makerules.mk' 'src/cmd/tw/updatedb.sh' 'src/lib/libast/features/stdio' 'src/lib/libast/features/mmap' 'src/lib/libast/path/pathtemp.c'` || :
  sed -i -e 's:/usr/tmp:/var/tmp:g' 2>/dev/null `grep -l '/usr/tmp' 'src/cmd/nmake/Makerules.mk' 'src/cmd/tw/updatedb.sh' 'src/lib/libast/features/stdio' 'src/lib/libast/features/mmap' 'src/lib/libast/path/pathtemp.c'` || :

  # https://forums.opensuse.org/showthread.php/508185-GCC-5/page2
  # https://build.opensuse.org/package/view_file/home:Andreas_Schwab:Factory/ksh/cpp.patch?expand=1
  sed -i -e 's:$cc -E:$cc -E -P:g' 'src/cmd/INIT/iffe.sh'

  patch -Nbup1 -i "${srcdir}/bz1477082.patch"
  set +u
}

# I haven't found any help on package parameters other than here:
# bin/package help 2>&1 | less

build() {
  set -u
  cd "${srcdir}"

  # This is from the Gentoo ebuild.
  # sh bin/package flat only make ast-ksh SHELL=sh SHOPT_SYSRC=1
  # See src/cmd/ksh93/Makefile for brief notes on options like SHOPT_SYSRC

  # Remove quiet to see the cc command lines.
  echo '>>>Starting multi core quiet build, watch htop for activity!'
  sh bin/package quiet only make 'ast-ksh' SHOPT_COSHELL=0 || :
  # Make errors can be found in src/arch/linux.i386-64/lib/package/gen or by
  # bin/package results

  # All the build errors happen after ksh so they don't seem too important.

  # Sometimes package make will return false and halt the PKGBUILD.
  # We'll implement our own detection. ksh guarantees that nmake also built.
  set +u
  if [ ! -x "arch/$(sh bin/package host)/bin/ksh" ]; then
    echo '>>>ksh not found, build failed'
    false
  else
    echo '>>>ksh build complete, ready to package'
  fi
}

check() {
  cd "${srcdir}"
  # This takes longer than the build so don't run it unless something big 
  # changes. It's not multi core so doesn't go much faster with a big CPU.
  # sh bin/package test

  # 2012.08.01 not tested
  # 2014.06.25 No errors up to where it freezes at
  # "test exit begins at 2015-06-05+06:51:17"
  # I had to kill the process.
}

# http://stackoverflow.com/questions/462100/bash-script-to-create-symbolic-links-to-shared-libraries
# $1: 0=cascade links    a.so -> a.so.1 -> a.so.1.1
#     1=consistent links a.so -> a.so.1.1, a.so.1 -> a.so.1.1
# $2: path of lib files
# Links will overwrite copied files but it's generally recommended to not copy
# unnecessary files.
_liblinks() {
# liblinks - generate symbolic links 
# given libx.so.0.0.0 this would generate links for libx.so.0.0, libx.so.0, libx.so
  local _FILE
  for _FILE in "$2"/*.so*; do
    #echo "${_FILE}"
    local _shortlib="$(basename "${_FILE}")"
    local _basename="${_shortlib}"
    local _dirname="$(dirname "${_FILE}")"
    local _extn
    while _extn="$(echo "${_shortlib}" | sed -n '/\.[0-9][0-9]*$/s/.*\(\.[0-9][0-9]*\)$/\1/p')" &&
        [ -n "${_extn}" ]; do
      _shortlib="$(basename "${_shortlib}" "${_extn}")"
      ln -sf "${_basename}" "${_dirname}/${_shortlib}"
      if [ "$1" -eq 0 ]; then
        _basename="${_shortlib}"
      fi
    done
  done
}

package() {
  set -u
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/lib"
  if ! :; then
    install -dm755 "${pkgdir}/usr/include"
    # ksh doesn't install ksh
    # ast-base installs way too much including a bunch of conflicting tools
    # ast-ksh doesn't install nmake
    # ast-ksh+ast-make same as ast-base
    sh bin/package flat install "${pkgdir}/usr/" 'ast-ksh' 'ast-make'
  else
    ## Install manually to avoid nmake dep
    # The Debian package was ast-ksh which doesn't include nmake. The entire
    # package is built from Mamfiles and mamake. I build ast-base which 
    # includes nmake and other utilities.
    # We do it manually to avoid the binaries we already have and we don't want
    # a full AT&T toolchain.

    # Copy the Debian man pages for shcomp. We even get a French version. 
    # Whoo-hoo! Like Ubuntu, I'm leaving the Debian branding in.
    cd "${srcdir}/debian/usr/share/man"
    local _doc
    for _doc in `find . -type f -name 'shcomp*.gz'`; do
      install -Dm644 "${_doc}" "${pkgdir}/usr/share/man/${_doc}"
    done

    # Install the shells with links to the alternates.
    cd "${srcdir}"
    cd "arch/$(sh bin/package host)"
    install -Dm755 'bin/ksh' "${pkgdir}/usr/bin/ksh"
    # The Gentoo ebuild shows us that softlinks work for the alternate shells.
    # Running rksh does show 'restricted' so I know that one works.
    local _exe
    for _exe in 'ksh93' 'rksh' 'pfksh'; do
      ln -sf 'ksh' "${pkgdir}/usr/bin/${_exe}"
    done
    install -Dm755 'bin/shcomp' "${pkgdir}/usr/bin/shcomp"
    install -Dm644 'man/man1/sh.1' "${pkgdir}/usr/share/man/man1/ksh.1"

    # Install Debian's kshrc file. I didn't check it for correctness to Arch Linux.
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/debian/usr/share/doc/ksh/example.kshrc" "${pkgdir}/usr/share/doc/${pkgname}/example.kshrc"
    # Install the same misc files that Debian installs.
    local _doc
    for _doc in 'COMPATIBILITY' 'OBSOLETE' 'PROMO.mm' 'RELEASE' 'RELEASE88' 'RELEASE93'; do
      install -Dm644 "${srcdir}/src/cmd/ksh93/${_doc}" "${pkgdir}/usr/share/doc/${pkgname}/${_doc}"
      gzip "${pkgdir}/usr/share/doc/${pkgname}/${_doc}"
    done

    # Debian wanted these too. It's not clear to me how they are used, why 
    # we change fun to functions, or why ast-base has made them 755 and Debian
    # has them 644. I'm just following along for no good reason.
    install -dm755 "${pkgdir}/usr/share/${pkgname}/functions"
    local _fun
    for _fun in 'dirs' 'popd' 'pushd'; do
      install -Dm644 "fun/${_fun}" "${pkgdir}/usr/share/${pkgname}/functions/${_fun}"
    done

    # Install the nmake option, just in case someone thinks
    # http://www2.research.att.com/~astopen/download/faq.html
    # "Is nmake(1) really the greatest thing since sliced bread?"
    if [ "${_opt_InstallNMAKE}" -ne 0 ]; then
      echo '>>>Installing optional nmake'
      install -Dm755 'bin/nmake' "${pkgdir}/usr/bin/nmake"
      install -Dm644 'man/man1/nmake.1' "${pkgdir}/usr/share/man/man1/nmake.1"
      install -Dm755 'lib/'libast.so.* "${pkgdir}/usr/lib/"
      _liblinks 1 "${pkgdir}/usr/lib"
    fi
  fi

  # Install modern LICENSE file. There are also BSD and ZLIB copyrights and 
  # licenses to consider. Noone else is adding them so they are likely 
  # unnecessary.
  cd "${srcdir}"
  sh bin/package copyright 'ast-ksh' > "${srcdir}/LICENSE"
  sh bin/package license 'ast-ksh' >> "${srcdir}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
