# vim: noet ft=sh

# Maintainer: Byron Johnson <byron@byronjohnson.net>

# This PKGBUILD makes a package that includes a standard ghc and cabal-install,
# but fixes it so it's not broken when you try to build normal things with it.
# See ‘README.md’ for more information.

# (Ensure versions are consistent within the fnuctions with the variables.)

# Argument for tabs for indentation: https://dmitryfrank.com/articles/indent_with_tabs_align_with_spaces

# Built with Archlinux system GHC 9.0.2 and cabal-install 3.4.1.0 with Cabal
# 3.4.1.0.

# If you get an rts version error (>=1.0 or 1.1 or whatever), maybe try
# restarting the build since it has (possibly non-deterministically) bitten me
# before when I was writing this up
# (https://gitlab.haskell.org/ghc/ghc/-/issues/22099).
#
# 2022-11-17 Yeah, I randomly get this error:
# 	"inplace/bin/ghc-cabal" configure libraries/ghc-prim dist-install --with-ghc="/home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/inplace/bin/ghc-stage1" --with-ghc-pkg="/home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/inplace/bin/ghc-pkg"  --disable-library-for-ghci --enable-library-vanilla --enable-library-for-ghci --enable-library-profiling --enable-shared --configure-option=CFLAGS="-Wall    -Werror=unused-but-set-variable -Wno-error=inline -iquote /home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/libraries/ghc-prim" --configure-option=LDFLAGS="  " --configure-option=CPPFLAGS="   " --gcc-options="-Wall    -Werror=unused-but-set-variable -Wno-error=inline -iquote /home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/libraries/ghc-prim   " --configure-option=--with-gmp --configure-option=--host=x86_64-unknown-linux --with-gcc="/usr/bin/gcc" --with-ld="ld.lld" --with-ar="/usr/bin/ar" --with-alex="/usr/bin/alex" --with-happy="/usr/bin/happy"
# 	Configuring ghc-prim-0.9.0...
# 	Error: ghc-cabal: Encountered missing or private dependencies:
# 	rts >=1.0 && <1.1

pkgbase=ghc-cabal-arts
pkgname=ghc-cabal-arts
#pkgver=9.4.2.0.1
pkgver=9.4.2
pkgrel=6
pkgdesc="Haskell setup to fix ‘There are files missing in the \`dynamic-1.0' package’ (9.4.2 / 3.9)."
url="https://github.com/bairyn/cabal/commits/fix-dynamic-deps-2-r6"
license=("BSD")
arch=('x86_64')
# We probably don't really need to use bubblewrap to do this, but it just makes
# bootstarpping cabal-install a lot easier.
makedepends=('ghc' 'cabal-install' 'ghc-libs' 'ghc-static' 'bubblewrap-suid')
depends=('libffi')
conflicts=('ghc' 'cabal-install' 'ghc-libs' 'ghc-static')
provides=('ghc' 'cabal-install' 'ghc-libs' 'ghc-static')
source=(
	https://github.com/bairyn/cabal/archive/3bd0588e9e693313e660cc7225c4d864892b5504.tar.gz
	#https://github.com/ghc/ghc/archive/refs/tags/ghc-9.4.2-release.tar.gz  # Probably easier for us to just get the submodules bundled, so use the next URL instead.
	https://downloads.haskell.org/~ghc/9.4.2/ghc-9.4.2-src.tar.xz
)
sha512sums=(
	84318c6080275202ba07f4b8a930dcb0cfde85be3979ee5659331abed68ad52db123004b57780fb3fce1559572ec4aa23c09a185d466016781e39dbc608622ad
	#381a8103b944008c0004a2492ff3bc10d865440b97e9dd451d3fec2ec1cb7c0fef3402baa43629c6ff18651e4a02933374f26d3a0eda0b57a07bb69265390564
	c55ad01b71ac3285dc057fcd3d83415767859cf20667374323bbaeefe9268b47ee0fc19add6860a8e1481e943855886cc7ace4bcb2f79349f94a44752c6aeccb
)
noextract=('3bd0588e9e693313e660cc7225c4d864892b5504.tar.gz' 'ghc-9.4.2-src.tar.xz')

# Be careful not to remove things we may want for this package.
options=(
	'!strip'
	'!staticlibs'
)

prepare() {
	# ################################################################
	# Unpack downloads (extract).
	# ################################################################

	echo "Extracting cabal (fix-dynamic-deps patchest)…"

	# Do it like the upstream PKGBUILD, I guess:
	# > Need to extract this tarball with a UTF-8 locale instead of a chroot's "C"
	# > locale; otherwise we get:
	# >   bsdtar: Pathname can't be converted from UTF-8 to current locale.
	LANG=en_US.UTF-8 bsdtar xf "3bd0588e9e693313e660cc7225c4d864892b5504.tar.gz"
	cabaldir="cabal-3bd0588e9e693313e660cc7225c4d864892b5504"

	echo "Extracting ghc…"

	# Likewise.
	LANG=en_US.UTF-8 bsdtar xf "ghc-9.4.2-src.tar.xz"
	ghcdir="ghc-9.4.2"

	# ################################################################
	# Patch (versioning, and ghc needs our own Cabal submodule replacement).
	# ################################################################

	echo "Patching cabal version requirements…"
	cd -- "$cabaldir"

	# We will be building Cabal with GHC 9.4.2 with base 4.17.  The default
	# version requirements in the cabal patchset commit have ‘< 4.17’ for base,
	# but we want ‘< 4.18’.  So change this in
	# ‘cabal-install-solver/cabal-install-solver.cabal’,
	# ‘cabal-install/cabal-install.cabal’, and
	# ‘cabal-testsuite/cabal-testsuite.cabal’.  Also change in
	# cabal-testsuite/cabal-testsuite.cabal the setup-depends constraint to be
	# 3.9 rather than 3.6 for Cabal* (Cabal and Cabal-syntax).
	sedBase='/base/s/(< *)4.17/\14.18/g; p'
	sedCabal='/Cabal/s/(== *)3\.6/\13\.9/g; p'
	for file in cabal-install-solver/cabal-install-solver.cabal cabal-install/cabal-install.cabal cabal-testsuite/cabal-testsuite.cabal; do
		sed -nEe "$sedBase" -i "$file"
		sed -nEe "$sedCabal" -i "$file"
	done
	cd -- ".."

	echo "Patching GHC version and Cabal submodule…"
	cd -- "$ghcdir"

	# Patch GHC's versions.
	# Just replace various Cabal* version ranges with the equivalent of ‘^>=3.9’.
	sedGHCCabal='/Cabal.*3\.9/{s/>= 3\.7 && < 3.9/>= 3.9 \&\& < 3.10/g; s/>= 1\.23 && < 3\.9/>= 3.9 \&\& < 3.10/g; s/>= 1.6 && <3.9/>= 3.9 \&\& <3.10/g}; p'
	for file in utils/ghc-cabal/ghc-cabal.cabal libraries/ghc-prim/ghc-prim.cabal libraries/ghc-boot/ghc-boot.cabal.in compiler/ghc.cabal.in; do
		sed -nEe "$sedGHCCabal" -i "$file"
	done

	# Optionally, update the GHC's own versioning.
	sed -nEe '/^:.*RELEASE=/s/RELEASE=YES/RELEASE=NO/g; p' -i "configure.ac"
	#sed -nEe '/AC_INIT/s/9\.4\.2/9.4.2.0.1/g; p' -i "configure.ac"
	#sed -nEe 's/9\.4\.2/9.4.2.0.1/g; p' -i "compiler/ghc.cabal" ||:

	# Now remove the old cabal submodule copy and copy in our own.
	rm -rf -- "./libraries/Cabal"
	cp -a -- "../$cabaldir" "./libraries/Cabal"

	cd -- ".."

	# ################################################################
	# ./boot
	# ################################################################

	echo "./boot…"
	cd -- "$ghcdir"
	cp -a -- "./boot.source" "./boot"  # Not sure why the tarball calls it boot.source instead.
	./boot
	cd -- ".."
}

build() {
	ghcdir="ghc-9.4.2"

	# Configure like the upstream ghc PKGBUILD.
	echo "Configuring ghc…"
	cd -- "$ghcdir"
	# (Hide other GHCs except those in /usr/bin.)
	PATH=/usr/bin ./configure \
		--prefix=/usr \
		--docdir=/usr/share/doc/ghc \
		--with-system-libffi \
		--with-ffi-includes="$(pkg-config --variable=includedir libffi)" \
		#

	# Optional: enhance performance.
	if true; then
		jobs="$(grep processor /proc/cpuinfo | tail -n 1 | awk '{print $3}')"
		makeJobs="-j$jobs"
	fi

	# Now build.
	echo "Building ghc…"
	#make ${makeJobs-}
	# Note: First try parallel, and then try sequential (one job), in case we
	# hit https://gitlab.haskell.org/ghc/ghc/-/issues/22099 :
	# 	"inplace/bin/ghc-cabal" configure libraries/ghc-prim dist-install --with-ghc="/home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/inplace/bin/ghc-stage1" --with-ghc-pkg="/home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/inplace/bin/ghc-pkg"  --disable-library-for-ghci --enable-library-vanilla --enable-library-for-ghci --enable-library-profiling --enable-shared --configure-option=CFLAGS="-Wall    -Werror=unused-but-set-variable -Wno-error=inline -iquote /home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/libraries/ghc-prim" --configure-option=LDFLAGS="  " --configure-option=CPPFLAGS="   " --gcc-options="-Wall    -Werror=unused-but-set-variable -Wno-error=inline -iquote /home/bairyn/git/ghc-cabal-arts/src/ghc-9.4.2/libraries/ghc-prim   " --configure-option=--with-gmp --configure-option=--host=x86_64-unknown-linux --with-gcc="/usr/bin/gcc" --with-ld="ld.lld" --with-ar="/usr/bin/ar" --with-alex="/usr/bin/alex" --with-happy="/usr/bin/happy"
	# 	Configuring ghc-prim-0.9.0...
	# 	Error: ghc-cabal: Encountered missing or private dependencies:
	# 	rts >=1.0 && <1.1
	# 	
	# 	make[1]: *** [libraries/ghc-prim/ghc.mk:4: libraries/ghc-prim/dist-install/package-data.mk] Error 1
	# 	make: *** [Makefile:126: all] Error 2
	# 	==> ERROR: A failure occurred in build().
	# 	    Aborting...
	#
	# (And of course the error could be due to something else, but this
	# workaround at least gets us a working build in case this issue
	# nondeterministically gets us.  (And maybe it's something else altogether;
	# I didn't look too deeply.))
	make ${makeJobs-} || {
		makeParallelCode="$?"
		echo "Warning: failed to build GHC in parallel (code $?); trying non-parallel…" 1>&2
		make
	}

	cd -- ".."
}

check() {
	echo "TODO: test…"
	: TODO
}

package_ghc-cabal-arts() {
	ghcdir="ghc-9.4.2"
	cabaldir="cabal-3bd0588e9e693313e660cc7225c4d864892b5504"

	echo "Installing ghc…"
	cd -- "$ghcdir"

	make DESTDIR="$pkgdir" install

	# Based on upstream PKGBUILD.
	install -d -m 0775 -- "$pkgdir/usr/share/libalpm/hooks"
	install -m 0775 -- "$srcdir/ghc-rebuild-doc-index.hook" "$pkgdir/usr/share/libalpm/hooks/ghc-rebuild-doc-index.hook" || {
		echo "Warning: could not find ghc-rebuild-doc-index.hook." 1>&2
	}

	cd -- ".."

	# Okay, good, we made it this far, meaning we at least were able to build
	# GHC.  In principle that's the hard part, and now we just need to
	# bootstrsap cabal-install.

	# ... That said, cabal-install still seems finnicky to get to bootstrap
	# here, more than I remember it being when I was building the patchset
	# myself.  Maybe because of system paths?  (If we at least have a working
	# GHC cross-compiler, then we at least can compile Haskell by hand,
	# including other Haskell2010 implementations.)

	echo "Preparing to handle cabal-install…"
	cd -- "$cabaldir"

	# So at this point, even wtih all the extra configuration flags:
	# > ghcOptionsDbs="--extra-include-dirs=/usr/include --extra-lib-dirs=/usr/lib --ghc-option=-v --ghc-option=$cabalAbsDir/tmp-store/ghc-9.4.2/package.db --ghc-option=-package-db --ghc-option=dist/package.conf.inplace --ghc-option=-package-db --ghc-option=-user-package-db --ghc-option=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d --ghc-option=-package-db --ghc-option=-no-global-package-db --ghc-option=-clear-package-db --ghc-option=-ghcversion-file=$pkgdir/usr/lib/ghc-9.4.2/rts/include/ghcversion.h"
	# I still found cabal-install/GHC still trying to pull in
	# /usr/lib/ghc-9.4.2/package.conf.d, probably the default global
	# package-db, which I was trying to hide.
	#
	# So instead, I decided to take the approach of pulling in a bubblewrap
	# build-dependency to hide /usr/lib as a directory that actually has our
	# overriden $pkgdir package DB.  (That is, when cabal is running, it can't
	# see /usr/lib/ghc-9.0.2 because we've patched it as an empty directory.)
	#
	# However, cabal-install itself needs files in /usr/lib/ghc-9.0.2
	# (run ldd on /usr/bin/cabal) in order to run, so to make cabal runnable
	# without this directory, we'll copy each .so from this directory and let
	# cabal know of them for runtime linking via LD_LIBRARY_PATH.

	emptyDir="$(pwd)/empty"
	origGhcDir="$(pwd)/lib-ghc"
	install -d -m 0775 -- "${emptyDir}"
	install -d -m 0775 -- "${origGhcDir}"
	# Note: we need the bubblewrap-suid variant for nesting or else we get an
	# error like this one
	# (https://www.reddit.com/r/bedrocklinux/comments/tcnu4n/bwrap_no_permissions_to_create_new_namespace/)
	# > Warning: could not find ghc-rebuild-doc-index.hook.
	# > Preparing to handle cabal-install…
	# > Building stage 1/2 cabal-install (dynamic-only flags).
	# > DEBUG89----------------------------------------------------
	# > bwrap: Creating new namespace failed: Operation not permitted
	# > ==> ERROR: A failure occurred in package_ghc-cabal-arts().
	# >     Aborting...
	# > nice -n 12 makepkg  14294.32s user 1151.88s system 502% cpu 51:13.13 total
	#
	# This may be used in eval-fashion.
	origGhcVersion="9.0.2"  # Default original (stage 0) GHC version.
	origGhcVersion="$(/usr/bin/ghc --version | sed -nEe 's/^.*[[:space:]]+([^[:space:]]*$)/\1/g; p')"  # Get the last word from ‘ghc --version’, which is its version, e.g. ‘9.0.2’.
	if ! [[ -e "/usr/lib/ghc-${origGhcVersion}" ]]; then
		echo "ERROR: package_ghc-cabal-arts(): failed to find a valid \$origGhcVersion such that /usr/lib/ghc-\$origGhcVersion exists: could not find ‘/usr/lib/ghc-$origGhcVersion’." 1>&2
		false
	fi
	for file in $(find "/usr/lib/ghc-${origGhcVersion}" -iname '*.so*'); do
		# for cabal-install
		cp -a -- "$file" "$origGhcDir/"
	done
	# Note bwrap drops LD_LIBRARY_PATH from the environment it seems for some
	# reason.
	export LD_LIBRARY_PATH="$origGhcDir:$LD_LIBRARY_PATH"
	withShadowedDirs=""
	if [[ "$origGhcVersion" != "9.4.2" ]]; then
		withShadowedDirs="/usr/bin/env LD_LIBRARY_PATH=$origGhcDir:\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH /usr/bin/bwrap --dev-bind / / --bind $emptyDir /usr/lib/ghc-$origGhcVersion --bind $pkgdir/usr/lib/ghc-9.4.2 /usr/lib/ghc-9.4.2 /usr/bin/env LD_LIBRARY_PATH=$origGhcDir:\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH "
	else
		withShadowedDirs="/usr/bin/env LD_LIBRARY_PATH=$origGhcDir:\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH /usr/bin/bwrap --dev-bind / /                                               --bind $pkgdir/usr/lib/ghc-9.4.2 /usr/lib/ghc-9.4.2 /usr/bin/env LD_LIBRARY_PATH=$origGhcDir:\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH "
	fi

	# That *almost* does it, except for one little problem:
	# > % /usr/bin/bwrap --dev-bind / / --bind …/emptydir /usr/lib/ghc-9.0.2 --bind …/dirwithstuff /usr/lib/ghc-9.4.2 bash
	# > bwrap: Can't mkdir /usr/lib/ghc-9.4.2: Permission denied

	# fakeroot and bwrap by themselves seem inadequate to provide a simple
	# solution, so we'll have to handle this ourselves.  It's a little
	# inefficient, but we'll just create our own temp …/usr/lib directory that
	# is a clone of the native /usr/lib dir except with a new directory,
	# /usr/lib/ghc-9.4.2.
	if [[ -e "/usr/lib/ghc-9.4.2" ]]; then
		# Nothing to do.
		#
		# (You can also just ‘sudo mkdir /usr/lib/ghc-9.4.2’ to creat an empty
		# directory to get to this point.)
		:
	else
		# fakeroot and bwrap can fake making a directory empty but not easily
		# making a new directory, without extra work such as we do here.
		#
		# If we don't do this extra step, bwrap will fail because it can't
		# create ‘/usr/lib/ghc-9.4.2’.
		echo "		(Note: /usr/lib/ghc-9.4.2 doesn't exist; setting up a temporary patched ‘…/usr/lib’ dir…)"
		echo "		(Note: 	(Alternatively, you may also run ‘sudo mkdir /usr/lib/ghc-9.4.2’ to temporarily create this empty dir to skip this step.))"
		patchedUsrLibDir="$(pwd)/patchedUsrLib"
		install -d -m 0775 -- "$patchedUsrLibDir"
		# We could just copy everything up over but /usr/lib can be big.  On my
		# system it's 11GiB or so.
		#
		# So to save on space requirements, we'll only copy all the top-level
		# *files* (non-directories), and then create empty directories to
		# bind-mount (--bind) the subtrees, so that now we have only (maybe
		# 3GiB?) of copying.
		binds=""
		for file in /usr/lib/*; do
			if [[ ! -d "$file" ]]; then
				cp -a -- "$file" "$patchedUsrLibDir/"
			else
				base="$(basename -- "$file")"
				install -d -m 0775 -- "$patchedUsrLibDir/$base"
				binds+=" --bind /usr/lib/$base $patchedUsrLibDir/$base"
			fi
		done

		# Prepend withShadowedDirs to use our patched to-be /usr/lib directory.
		patchLibLayer="--bind $patchedUsrLibDir /usr/lib"
		withShadowedDirs="/usr/bin/env LD_LIBRARY_PATH=$origGhcDir:\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH /usr/bin/bwrap --dev-bind / / $patchLibLayer $withShadowedDirs"
		bindLayer="$binds"
		withShadowedDirs="/usr/bin/env LD_LIBRARY_PATH=$origGhcDir:\$LD_LIBRARY_PATH:$LD_LIBRARY_PATH /usr/bin/bwrap --dev-bind / / $bindLayer $withShadowedDirs"
		# Now instead of 1 bwrap layer, we have 3 to get the FS we need.
	fi

	# Finally for this stage, just run a couple bwrapped commands as basically
	# no-ops to try to detect a possible failure (e.g. if we hit shell argument
	# limits) so that we can try to help the user in this case, e.g. by doing
	# the ‘sudo mkdir /usr/lib/ghc-9.4.2’ temporary directory hack.
	$withShadowedDirs true && $withShadowedDirs true arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 || {
		code="$?"
		echo "ERROR: package_ghc-cabal-arts(): failed to use ‘\$withShadowedDirs’ to patch native build dirs (code $?)." 1>&2
		echo "	Consider running ‘sudo mkdir /usr/lib/ghc-9.4.2’ to create a temporary empty directory for this build as a workaround and trying again." 1>&2
		false
	}

	# Bootstrap cabal-install.

	# This stage 1 cabal-install is built with only dynamic files, and then we
	# will use this stage 1 cabal-install executable (until this point we just
	# want an updated, working cabal-install program in order to rebuild the
	# whole cabal-install thing) to build the real stage 2 cabal-install, this
	# time without dynamic-only flags.
	#echo "Building stage 1/2 cabal (may default to user host files when updating and downloading / building)…"
	echo "Building stage 1/2 cabal-install (dynamic-only flags)."

	# Check paths for characters we currently can't handle.
	if [[ -n "$(sed -nEe "/[^[:alnum:][:punct:]]/p" <<< "$(pwd)")" ]]; then
		printf '%s\n' "Error: package_ghc-cabal-arts():" 1>&2
		printf '%s\n' "	The current path has spaces or other invalid characters, and this" 1>&2
		printf '%s\n' "	PKGBUILD currently does not have adequately sophisticated quoting" 1>&2
		printf '%s\n' "	to handle this at the momnet.  Consider disabling this check if" 1>&2
		printf '%s\n' "	you know what you are doing or else volunteering a fix." 1>&2
		false
	fi

	# Get a temporary bin/ directory so that cabal has access to our newer ghc.
	#
	# Base it on $pkgdir/usr/bin.
	# Just replace ‘"/usr/bin’ with # ‘"$pkgdir/usr/bin’.
	rm -rf -- "./tmp-bin"
	cp -ai -- "$pkgdir/usr/bin" "./tmp-bin"
	for file in ./tmp-bin/*; do
		pkgdirEscaped=$(sed -nEe 's/[^[:alnum:]]/\\&/g; p' <<< "$pkgdir")
		sed -nEe "s@\"/usr@\"$pkgdirEscaped/usr@; p" -i "$file"
	done
	origPath="$PATH"
	cabalAbsDir="$(pwd)"
	tmpBin="$cabalAbsDir/tmp-bin"
	tmpPath="$tmpBin:$origPath"

	# Try to trick cabal-install into not default to host user stores; avoid
	# host contamination.
	ln -nsf -- "./tmp-store" ".cabal"

	# Stage-1-only temporary store.
	install -d -m 0775 -- "./tmp-store"
	tmpStoreDir="$(pwd)/tmp-store"

	# It's backwards.  That is, when I looked at the ghc command called, the
	# arguments were in reverse order for some reason.  Okay, so I'll just
	# reverse the order of the arguments here.
	#ghcOptionsDbs="--ghc-option=-ghcversion-file=$pkgdir/usr/lib/ghc-9.4.2/rts/include/ghcversion.h --ghc-option=-no-global-package-db --ghc-option=-package-db --ghc-option=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d --ghc-option=-user-package-db --ghc-option=-package-db --ghc-option=$cabalAbsDir/tmp-store/ghc-9.4.2/package.db --ghc-option=-v --extra-lib-dirs=/usr/lib --extra-include-dirs=/usr/include"
	ghcOptionsDbs="--extra-include-dirs=/usr/include --extra-lib-dirs=/usr/lib --ghc-option=-v --ghc-option=$cabalAbsDir/tmp-store/ghc-9.4.2/package.db --ghc-option=-package-db --ghc-option=-user-package-db --ghc-option=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d --ghc-option=-package-db --ghc-option=-no-global-package-db --ghc-option=-ghcversion-file=$pkgdir/usr/lib/ghc-9.4.2/rts/include/ghcversion.h"

	# Build stage-1 cabal-install.
	echo "	(Updating index…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs /usr/bin/cabal -v --store-dir="$tmpStoreDir" --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-update --project-file="$cabalAbsDir/cabal.project.release" \
		-O --prefix="$tmpStoreDir" --docdir="$tmpStoreDir/share/doc/cabal-install" --datasubdir="cabal-install" \
		--dynlibdir="$tmpStoreDir/lib" --libsubdir="compiler/site-local/\$pkgid" \
		#

	echo "	(Stage 1/2, configuring 1/2…)"
	# Run configure twice, once to generate a default $cabalAbsDir/.cabal/config, so we can enable default dynamic flags.
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs /usr/bin/cabal -v --store-dir="$tmpStoreDir" --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-configure --project-file="$cabalAbsDir/cabal.project.release" cabal-install \
		-O --prefix="$tmpStoreDir" --docdir="$tmpStoreDir/share/doc/cabal-install" --datasubdir="cabal-install" \
		--dynlibdir="$tmpStoreDir/lib" --libsubdir="compiler/site-local/\$pkgid" \
		#

	echo "	(Setting up additional configuration…)"
	# Patch the user-level cabal config to temporarily set dynamic-only
	# settings just to build phase 1 cabal-install.  Phase 1 cabal-install can
	# handle differences in static vs dynamic files better, so after phase 1
	# cabal-install is built and installed, then we can reset our settings so
	# that when phase 2 cabal-install (what will ultimately be installed) it's
	# dynamic and static.
	sed -nEe '/^(-- *)?library-vanilla: *(False|True|)$/s//library-vanilla: False/g; p' -i "$cabalAbsDir/.cabal/config"
	sed -nEe '/^(-- *)?shared: *(|True|False)$/s//shared: True/g; p' -i "$cabalAbsDir/.cabal/config"
	sed -nEe '/^(-- *)?executable-dynamic: *(True|False|)$/s//executable-dynamic: True/g; p' -i "$cabalAbsDir/.cabal/config"

	# Also since old cabals might ignore our config options, add the
	# ghc-*-options to .cabal/config and set up extra-lib-dirs and
	# extra-include-dirs, to make visible host build files.
	sed -nEe '/^(-- *)?extra-lib-dirs: *$/s@@extra-lib-dirs: /usr/lib@g; p' -i "$cabalAbsDir/.cabal/config"
	sed -nEe '/^(-- *)?extra-include-dirs: *$/s@@extra-include-dirs: /usr/include@g; p' -i "$cabalAbsDir/.cabal/config"

	if true; then
		# (Leave "$cabalAbsDir/tmp-store/ghc-9.4.2/package.db" in only ghcOptionDbs
		# for now so we don't need to have more escaping.)
		sed -nEe '/^(-- *)?package-db: *$/s@@package-db: '"$pkgdirEscaped"'/usr/lib/ghc-9.4.2/package.conf.d\nghc-pkg-option: --global-package-db='"$pkgdirEscaped"'/usr/lib/ghc-9.4.2/package.conf.d\nghc-option: -ghcversion-file='"$pkgdirEscaped"'/usr/lib/ghc-9.4.2/rts/include/ghcversion.h\nghc-option: -clear-package-db\nghc-option: -no-global-package-db\nghc-option: -package-db '"$pkgdirEscaped"'/usr/lib/ghc-9.4.2/package.conf.d\nghc-option: -user-package-db\nghc-option: -package-db dist/package.conf.inplace\nghc-option: -v@g; p' -i "$cabalAbsDir/.cabal/config"
	fi

	echo "	(Stage 1/2, configuring 2/2…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs /usr/bin/cabal -v --store-dir="$tmpStoreDir" --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-configure --project-file="$cabalAbsDir/cabal.project.release" cabal-install \
		-O --prefix="$tmpStoreDir" --docdir="$tmpStoreDir/share/doc/cabal-install" --datasubdir="cabal-install" \
		--dynlibdir="$tmpStoreDir/lib" --libsubdir="compiler/site-local/\$pkgid" \
		#

	echo "	(Stage 1/2, building…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs /usr/bin/cabal -v --store-dir="$tmpStoreDir" --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-build --project-file="$cabalAbsDir/cabal.project.release" cabal-install \
		#

	echo "	(Stage 1/2, installing…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs /usr/bin/cabal -v --store-dir="$tmpStoreDir" --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-install --project-file="$cabalAbsDir/cabal.project.release" cabal-install --overwrite-policy=always \
		--prefix="$tmpStoreDir" --installdir="$tmpBin" \
		#

	# Reset config.
	echo "	(Resetting configuration for stage 2/2…)"
	sed -nEe '/^(-- *)?library-vanilla: (False|True|)$/s//--library-vanilla: True/g; p' -i "$cabalAbsDir/.cabal/config"
	sed -nEe '/^(-- *)?shared: (|True|False)$/s//--shared: False/g; p' -i "$cabalAbsDir/.cabal/config"
	sed -nEe '/^(-- *)?executable-dynamic: (True|False|)$/s//--executable-dynamic: True/g; p' -i "$cabalAbsDir/.cabal/config"

	cd -- ".."

	echo "Building cabal-install…"
	cd -- "$cabaldir"

	# We'll actually build cabal-install in 2 stages.  The host cabal is the
	# stage 0 bootstrapping cabal-install
	install -d -m 0775 -- "./tmp-store"
	tmpStoreDir="./tmp-store"

	# Let hosttools cabal know of Hackage packages.
	echo "	(Updating index…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-update --project-file="$cabalAbsDir/cabal.project.release" \
		-O --prefix="$pkgdir/usr" --docdir="$pkgdir/usr/share/doc/cabal-install" --datasubdir="cabal-install" \
		--dynlibdir="$pkgdir/usr/lib" --libsubdir="compiler/site-local/\$pkgid" \
		#

	# Configure like haskell-scientific's PKGBUILD.
	echo "	(Configuring…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-configure --project-file="$cabalAbsDir/cabal.project.release" cabal-install \
		-O --prefix="$pkgdir/usr" --docdir="$pkgdir/usr/share/doc/cabal-install" --datasubdir="cabal-install" \
		--dynlibdir="$pkgdir/usr/lib" --libsubdir="compiler/site-local/\$pkgid" \
		#
	echo "	(Building…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-build --project-file="$cabalAbsDir/cabal.project.release" cabal-install \
		#

	echo "Installing cabal-install…"
	echo "	(Installing…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-install --project-file="$cabalAbsDir/cabal.project.release" cabal-install --overwrite-policy=always \
		--prefix="$pkgdir/usr" --installdir="$pkgdir/usr/bin" \
		#
	echo "	(Installing (lib)…)"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-install --project-file="$cabalAbsDir/cabal.project.release" cabal-install --lib --overwrite-policy=always \
		--prefix="$pkgdir/usr" \
		#

	# Optional: also install cabal-tests.
	#
	# (Don't fail if this fails to build for some reason.)
	echo "Optionally building and installing cabal-tests…"
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-configure --project-file="$cabalAbsDir/cabal.project.validate" cabal-testsuite:cabal-tests \
		-O --prefix="$pkgdir/usr" --docdir="$pkgdir/usr/share/doc/cabal-install" --datasubdir="cabal-install" \
		--dynlibdir="$pkgdir/usr/lib" --libsubdir="compiler/site-local/\$pkgid" \
		&& \
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-build --project-file="$cabalAbsDir/cabal.project.validate" cabal-testsuite:cabal-tests \
		&& \
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-install --project-file="$cabalAbsDir/cabal.project.validate" cabal-testsuite:cabal-tests --overwrite-policy=always \
		--prefix="$pkgdir/usr" --installdir="$pkgdir/usr/bin" \
		&& \
	PATH="$tmpPath" HOME="$cabalAbsDir" $withShadowedDirs cabal -v --store-dir="$pkgdir/usr/lib" --ghc-pkg-option="--global-package-db=$pkgdir/usr/lib/ghc-9.4.2/package.conf.d" \
		$ghcOptionsDbs \
		v2-install --project-file="$cabalAbsDir/cabal.project.validate" cabal-testsuite:cabal-tests --lib --overwrite-policy=always \
		--prefix="$pkgdir/usr" \
		|| {
		echo "Warning: failed to build and install cabal-tests ($?)." 1>&2
	}

	echo "Installing Cabal misc files…"
	# From upstream cabal-install PKGBUILD.
	install -d -m 0775 -- "$pkgdir/usr/share/licenses/$pkgname"
	install -m 0664 -- "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d -m 0775 -- "$pkgdir/usr/share/bash-completion/completions"
	install -m 0664 -- "bash-completion/cabal" "$pkgdir/usr/share/bash-completion/completions/cabal" || {
		install -m 0664 -- "cabal-install/bash-completion" "$pkgdir/usr/share/bash-completion/completions/cabal" || {
			echo "Warning: could not find bash-completion file." 1>&2
		}
	}

	cd -- ".."
}
