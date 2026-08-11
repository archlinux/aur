# Maintainer: Javier Tia <floss@jetm.me>

pkgname=yocto-uninative-tarball
# Tracks Arch's glibc exactly, in Arch's own pkgver shape:
# <glibc>+r<commits past tag>+g<12-char sha>. Building from the same commit
# Arch ships is the whole point: it makes the tarball's glibc and the host's
# glibc the same build, so the uninative-vs-host version check below can never
# be a judgement call. update-version.sh rewrites pkgver and _commit together
# from Arch's packaging PKGBUILD; neither is hand-maintained.
pkgver=2.44+r24+g16be1518495f
_commit=16be1518495f1fa05481b0182c4e4c24927c62df
pkgrel=1
pkgdesc='Yocto uninative libc tarball built from the glibc commit Arch ships'
arch=('x86_64')
url='https://git.openembedded.org/openembedded-core/tree/meta/classes-global/uninative.bbclass'
# glibc itself is LGPL-2.1-or-later. The assembled payload also carries
# libgcc_s and libstdc++ (GPL-3.0-or-later WITH GCC-exception-3.1), libcrypt
# (LGPL-2.1-or-later), libtirpc (BSD-3-Clause) and relocate_sdk.py (GPL-2.0-only).
license=('LGPL-2.1-or-later' 'GPL-3.0-or-later WITH GCC-exception-3.1'
         'BSD-3-Clause' 'GPL-2.0-only')
# One entry per package providing a library build() copies out of /usr/lib -
# the copies are plain file reads, so an absent provider fails the build rather
# than degrading. libstdc++ and libgcc rather than gcc-libs, because Arch split
# those shared objects out of it. libgomp and libatomic were missed when they
# were added to the copy list; they happen to be present anyway as gcc-libs
# dependencies, which is why CI never noticed, but relying on that leaves the
# build dependent on something it does not declare.
#
makedepends=('git' 'python' 'bison' 'patchelf' 'linux-api-headers'
             'libstdc++' 'libgcc' 'libgomp' 'libatomic'
             'libxcrypt' 'libxcrypt-compat'
             'libtirpc' 'libnsl')
# Only two of these do anything here, and it is worth being precise because the
# other two look like they are protecting the payload and are not:
#   !lto    load-bearing - stops makepkg appending -flto. glibc does not build
#           with LTO.
#   !debug  load-bearing for a different reason - stops DEBUG_CFLAGS being
#           appended when the invoking makepkg.conf enables the debug option.
#   !strip / staticlibs  no-ops. Both act on $pkgdir, which holds one .tar.xz
#           and one .inc; makepkg cannot see inside the tarball, so it was
#           never going to strip the payload. Kept only as documentation of
#           intent - do not rely on them to preserve anything.
options=('staticlibs' '!lto' '!strip' '!debug')

# sourceware.org is the upstream of record and is what Arch's own PKGBUILD
# fetches. git.launchpad.net is used here only because sourceware has been
# unreachable; it is a SHA-identical mirror, and #commit= pins the content
# cryptographically, so which host serves the bytes cannot change what is built.
_glibc_url='https://git.launchpad.net/glibc'

# The prefix baked into the loader at build time. relocate_sdk.py rewrites it
# in .interp, .sysdirs, .ldsocache and .gccrelocprefix when bitbake extracts the
# tarball, so this literal is never used as a real path.
#
# It does NOT have to match oe-core's SDKPATH. bitbake runs OUR relocate_sdk.py,
# out of OUR tarball, with OUR value already substituted into it - there is no
# coupling to upstream here at all. The only invariant is that this string is
# byte-identical to the prefix glibc was configured with below, so the pattern
# matches the strings actually baked into those sections.
#
# It must also stay free of regex metacharacters: relocate_sdk.py compiles the
# substituted value with re.compile(), so a '.' or '+' in the path would become
# a wildcard or a quantifier. Upstream escapes both (uninative-tarball.bb's
# create_sdk_files sed) because SDKPATH contains a version number; we keep the
# literal metacharacter-free instead and assert it, which is the same guarantee
# with less machinery. A mismatch here does not fail - relocation silently
# matches nothing and every native binary keeps the placeholder PT_INTERP.
_sdkpath=/usr/local/oe-sdk-hardcoded-buildpath
_sysroot=$_sdkpath/sysroots/x86_64-pokysdk-linux
if [[ ! $_sysroot =~ ^[A-Za-z0-9/_-]+$ ]]; then
  echo "PKGBUILD: _sysroot contains a regex metacharacter: $_sysroot" >&2
  return 1 2>/dev/null || exit 1
fi

_tarball="x86_64-nativesdk-libc-${pkgver}.tar.xz"

source=(
  "glibc::git+${_glibc_url}#commit=${_commit}"
  '0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch'
  '0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch'
  '0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch'
  '0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch'
  '0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch'
  'relocate_sdk.py'
  'glibc-upgrade-check.sh'
  'yocto-uninative-glibc.hook'
)
# SKIP applies to the git source only: #commit= already pins it by hash.
sha256sums=('SKIP'
            '51b37918062f74052a336bc2afa9567b4f93b37afc9ace7e9195dec9f1c5efcb'
            'dbc290164d623daab992c92264f5dd12c40202da43dcade9c10706d25da4ce60'
            'c21269c1b1c12dd9c59ca71a5bf1df7bd3d2359e38003e198fcfae479a617f5d'
            'd3902264bb4ded821fbc3dd1dba045c6335f27b68af444179b48a9387a54ea12'
            'c2653e464b775f492d88f33561fff9f6648faa0d870554991bb5ee959a5dcb69'
            'f99662254a8ccfb87b2cbea8677d7bef29b452158e036123a64453ee71cc6288'
            '726b902fd38efa483ba3147ce4644564ad8a480ba70d278d3e8747a3e5f5de9b'
            '7edf7d3195dc5a4a740bd9c0e716cadf48e6055b4525c5dd7bb0278b694d503c')

prepare() {
  # pkgver carries only the 12-char short sha, so _commit cannot be derived
  # from it and the two are written independently by update-version.sh. A
  # desync would silently build a different glibc than the version claims.
  local _shortsha=${pkgver##*+g}
  if [[ $_commit != "$_shortsha"* ]]; then
    error "_commit (%s) does not match the short sha in pkgver (%s)" \
      "$_commit" "$_shortsha"
    return 1
  fi

  cd glibc

  # 0003/0005/0006/0007 are carried verbatim from oe-core. 0004 is re-anchored
  # onto glibc 2.44, where elf/dl-load.c replaced alloca with
  # dl_scratch_buffer_allocate; the buffer-sizing formula it guards is
  # unchanged, so the patch is still load-bearing and was not dropped.
  # Derived from source=(), not globbed: a glob has to be kept in sync with the
  # array by hand, and adding 0008-*.patch to source= without touching the glob
  # would fetch and checksum it and then never apply it, silently.
  #
  # -F0 forbids fuzz. GNU patch defaults to a fuzz factor of 2, so a hunk that
  # has drifted still applies - at an offset, exit 0, no output. _commit is
  # bumped unattended by CI on every Arch glibc rebuild, and 0004 has already
  # had to be re-anchored by hand once; a silent fuzzy apply is exactly how a
  # subtly-misplaced loader patch would reach the AUR.
  local _s _p
  for _s in "${source[@]}"; do
    _p=${_s##*/}
    [[ $_p == *.patch ]] || continue
    msg2 "applying %s" "$_p"
    patch -p1 -F0 --no-backup-if-mismatch -i "$srcdir/$_p"
  done

  mkdir -p "$srcdir/glibc-build"
}

build() {
  local _install="$srcdir/sysroot-install"
  local _tree="$srcdir/uninative/x86_64-linux"

  # Tuned makepkg.conf files (CachyOS ships -march=native -O3) are wrong for
  # this package in two independent ways, so pin the flags that matter rather
  # than inheriting them:
  #
  #   -O3    glibc does not build at -O3. misc/syslog.c fails with "inlining
  #          failed in call to always_inline 'syslog'" because the
  #          ldbl_strong_alias of __syslog stops being inlinable once -O3
  #          changes the inlining decisions. Upstream supports -O2.
  #
  #   -march=native  would bake this machine's ISA into a libc that bitbake
  #          shares across hosts through sstate. That failure is far worse
  #          than a build error: it surfaces as SIGILL on a machine with an
  #          older CPU, long after the artifact was published.
  #
  # Appended rather than substituted: later -O and -march flags win, so this
  # holds regardless of what the invoking makepkg.conf contains.
  CFLAGS+=" -march=x86-64 -mtune=generic -O2"
  CXXFLAGS+=" -march=x86-64 -mtune=generic -O2"

  # Cannot be overridden by appending - it is a preprocessor define. Arch
  # strips the same flag; fortification is enabled via --enable-fortify-source.
  # Both variables: Arch's makepkg.conf defines CXXFLAGS="$CFLAGS ...", so
  # stripping CFLAGS alone leaves the flag alive on the C++ side.
  CFLAGS=${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}
  CXXFLAGS=${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}

  # glibc's loader must be linked with GNU ld. CachyOS's makepkg.conf sets
  # -fuse-ld=mold, and mold ignores -z nomark-plt (warning only), which leaves
  # _PROCEDURE_LINKAGE_TABLE_ undefined in ld.so and trips glibc's own check
  # that the loader carries no undefined symbols. bfd is also what Arch's
  # stock makepkg.conf uses, so this keeps the build matching Arch's.
  LDFLAGS="${LDFLAGS//-fuse-ld=mold/} -fuse-ld=bfd"

  (
    cd "$srcdir/glibc-build"

    # slibdir/rtlddir put the loader and core libs in <sysroot>/lib rather than
    # <sysroot>/usr/lib. uninative.bbclass hardcodes
    # UNINATIVE_LOADER=<tree>/lib/ld-linux-x86-64.so.2 and relocates
    # <tree>/lib/libc*.so*, so this split is required, not cosmetic.
    echo "slibdir=$_sysroot/lib" >>configparms
    echo "rtlddir=$_sysroot/lib" >>configparms
    echo "sbindir=$_sysroot/usr/bin" >>configparms
    echo "rootsbindir=$_sysroot/usr/bin" >>configparms

    # Flags mirror Arch's glibc so the produced libc behaves like the host's.
    # --enable-cet and --enable-sframe are Arch's x86_64 additions; lib32 and
    # the systemtap probes are dropped because nothing in an SDK sysroot uses
    # them and both only add build dependencies.
    "$srcdir"/glibc/configure \
      --prefix="$_sysroot/usr" \
      --libdir="$_sysroot/usr/lib" \
      --libexecdir="$_sysroot/usr/lib" \
      --with-headers=/usr/include \
      --enable-bind-now \
      --enable-cet \
      --enable-sframe \
      --enable-fortify-source \
      --enable-kernel=4.4 \
      --enable-multi-arch \
      --enable-stack-protector=strong \
      --disable-nscd \
      --disable-profile \
      --disable-werror

    make -O
    make install DESTDIR="$_install"
  )

  # Compile the binary locales the payload has to ship. `make install` lays
  # down only the i18n *sources* under usr/share/i18n; with nothing compiled in
  # usr/lib/locale, setlocale() succeeds for C and POSIX and fails for every
  # other locale - including C.UTF-8, which is not built into the library.
  #
  # That is not a cosmetic gap. bitbake forces LC_ALL into every task by two
  # independent mechanisms, and BOTH are needed for the conclusion - do not
  # simplify this comment down to the first one:
  #   1. bb.utils.filter_environment sets os.environ["LC_ALL"] = "en_US.UTF-8"
  #      ("Ideally we'd use C.UTF-8 but not all distros support that"), and
  #      LC_ALL is in preserved_envvars_exported so it survives into the task
  #      env. This path is skipped entirely when BB_PRESERVE_ENV is set -
  #      clean_environment() returns early - so it is not unconditional.
  #   2. oe-core's bitbake.conf carries a hard `export LC_ALL = "en_US.UTF-8"`,
  #      which covers the BB_PRESERVE_ENV case.
  # A native tool that calls
  # setlocale(LC_ALL, "") then fails: dnf-native prints "Failed to set locale,
  # defaulting to C", OE's RpmRootfs log_check matches that on "Fail", and
  # do_rootfs aborts with the rootfs already fully and correctly assembled.
  #
  # Upstream ships this, but NOT via TOOLCHAIN_HOST_TASK - that list names only
  # nativesdk-glibc{,-dbg,-gconvs} and friends, and glibc-package.inc's
  # stash_locale_cleanup actively strips ${localedir} from nativesdk-glibc. The
  # locale data arrives through the SDK machinery instead: uninative-tarball.bb
  # does `inherit populate_sdk`, and populate_sdk_base.bbclass:120-122 adds
  #     SDK_DEPENDS = "... cross-localedef-native"
  #     SDK_DEPENDS += "nativesdk-glibc-locale"
  # with SDKIMAGE_LINGUAS ?= "all" (:46). Verified against the published
  # artifact rather than inferred: YP's x86_64-nativesdk-libc-5.1.tar.xz
  # carries usr/lib/locale/locale-archive at 101,696,416 bytes holding 152
  # locales, C.utf8 among them.
  #
  # We ship two of those 152, not all: en_US.UTF-8 because bitbake hardcodes
  # it, and C.UTF-8 because bitbake.conf's `export LC_ALL` is a plain
  # assignment a user CAN override to C.UTF-8 in local.conf - so the second
  # locale covers that escape hatch rather than being decorative. The pair
  # costs ~3 MB against upstream's ~97 MB uncompressed.
  #
  # Run the freshly built localedef through the freshly built loader. Its own
  # PT_INTERP names the SDK path, which does not exist until bitbake relocates
  # the tarball, so it cannot be exec'd directly; and borrowing the host's
  # localedef would tie the archive format to whatever glibc the build machine
  # happens to run rather than the one being packaged. --prefix prepends to
  # localedef's compiled-in complocaledir, which is already under _sysroot, so
  # passing _install lands the archive exactly where the mv below picks it up.
  local _ldso="$_install$_sysroot/lib/ld-linux-x86-64.so.2"
  local _libpath="$_install$_sysroot/lib:$_install$_sysroot/usr/lib"
  local _localedef="$srcdir/glibc-build/locale/localedef"
  local _loc
  install -d "$_install$_sysroot/usr/lib/locale"
  for _loc in en_US:en_US.UTF-8 C:C.UTF-8; do
    I18NPATH="$_install$_sysroot/usr/share/i18n" \
      "$_ldso" --library-path "$_libpath" "$_localedef" \
      --prefix="$_install" -i "${_loc%%:*}" -f UTF-8 "${_loc##*:}"
  done

  # Assert the archive actually contains BOTH locales the loop above built.
  # localedef exits 0 having written an archive that a missing charmap or i18n
  # source left empty, and an empty archive fails exactly like no archive at
  # all - only later, inside someone's do_rootfs. Checking only en_US would
  # miss the same failure for C.UTF-8, which the local.conf override path needs.
  #
  # localedef's stderr is captured, not discarded: it carries the one message
  # that distinguishes "no archive" from "archive present but empty".
  local _archive="$_install$_sysroot/usr/lib/locale/locale-archive"
  local _listing _want
  if ! _listing=$("$_ldso" --library-path "$_libpath" "$_localedef" \
    --list-archive "$_archive" 2>&1); then
    error "cannot read the generated locale-archive: %s" "$_listing"
    return 1
  fi
  for _want in en_US.utf8 C.utf8; do
    if ! printf '%s\n' "$_listing" | grep -qx "$_want"; then
      error "locale-archive is missing %s (contains: %s); bitbake forces LC_ALL=en_US.UTF-8 and every native setlocale would fail" \
        "$_want" "$(printf '%s' "$_listing" | tr '\n' ' ')"
      return 1
    fi
  done

  # The tarball's x86_64-linux/ IS the sysroot: bitbake extracts the tarball
  # and passes <tree>/x86_64-linux to relocate_sdk.py as the new prefix.
  rm -rf "$srcdir/uninative"
  mkdir -p "$srcdir/uninative"
  mv "$_install$_sysroot" "$_tree"

  # Drop glibc's utility binaries. `make install` lays down getent, ldd, iconv,
  # locale, localedef, gencat, sln, sotruss, zic and friends; upstream's
  # uninative tarball ships NONE of them, and shipping them breaks the build.
  #
  # Upstream's uninative-tarball.bb pulls only nativesdk-glibc{,-dbg,-gconvs},
  # -patchelf, -libxcrypt{,-compat}, -libnss-nis, -libgcc and
  # -sdk-provides-dummy. In oe-core's glibc packaging those binaries live in
  # SEPARATE packages that the task list deliberately omits:
  #     FILES:ldd         = "${bindir}/ldd"
  #     FILES:${PN}-utils = "${bindir}/* ${sbindir}/*"
  #     FILES:${PN}       = "${libc_baselibs} ${libexecdir}/* ..."   # no bin/
  # so upstream's usr/bin holds essentially just patchelf-uninative.
  #
  # Why shipping them is actively harmful: uninative.bbclass relocates ONLY the
  # loader, patchelf-uninative and libc*.so* - see the relocate_sdk.py call in
  # that class. Every other binary keeps the placeholder PT_INTERP
  # (/usr/local/oe-sdk-hardcoded-buildpath/...), so exec'ing it fails with
  # ENOENT even though the file is present. bitbake puts <tree>/usr/bin at
  # PATH position 2, ahead of /usr/bin, so these unrelocated copies SHADOW the
  # host's working ones. Observed fallout: systemd-systemctl-native's
  # do_configure died on meson `find_program('getent')` -> getent passwd 65534,
  # and gobject-introspection-native's do_compile died on giscanner invoking
  # `ldd`. Relocating them instead would be wrong even if it worked - a getent
  # that shadows the host's would read the uninative tree's NSS config.
  #
  # Runs BEFORE patchelf-uninative is installed below, so it is not caught.
  rm -rf "$_tree/usr/bin" "$_tree/usr/sbin" "$_tree/bin" "$_tree/sbin"

  # Prune lib/ to upstream's allowlist rather than deleting known-bad entries.
  #
  # This is the same class of fix as the usr/bin deletion above, generalised.
  # Upstream defines its payload by an allowlist - FILES:${PN} is exactly
  # ${libc_baselibs} (glibc-package.inc:17), a soname-by-soname enumeration -
  # and everything `make install` produces that is not on it falls into a
  # package uninative-tarball.bb never pulls. Ours was a denylist, and both
  # production failures so far were denylist drift: files we did not know to
  # remove (the shadowing binaries) and files we did not know to add (libgomp,
  # libatomic). An allowlist degrades in the safe direction - a new glibc
  # soname goes missing loudly at load time instead of being shipped silently.
  #
  # Copied from libc_baselibs verbatim so a diff against oe-core stays trivial.
  # The non-glibc libraries added further down land in usr/lib and are not
  # subject to this list.
  local _keep=(
    'libc.so.*' 'libc-*.so'
    'libm*.so.*' 'libm-*.so' 'libmvec-*.so'
    'ld*.so.*' 'ld-*.so'
    'libpthread*.so.*' 'libpthread-*.so'
    'libresolv*.so.*' 'libresolv-*.so'
    'librt*.so.*' 'librt-*.so'
    'libutil*.so.*' 'libutil-*.so'
    'libnsl*.so.*' 'libnsl-*.so'
    'libnss_files*.so.*' 'libnss_files-*.so'
    'libnss_compat*.so.*' 'libnss_compat-*.so'
    'libnss_dns*.so.*' 'libnss_dns-*.so'
    'libdl*.so.*' 'libdl-*.so'
    'libanl*.so.*' 'libanl-*.so'
    'libBrokenLocale*.so.*' 'libBrokenLocale-*.so'
  )
  local _f _base _pat _hit _dropped=0
  for _f in "$_tree/lib"/*; do
    [[ -e $_f ]] || continue
    _base=${_f##*/}
    _hit=0
    for _pat in "${_keep[@]}"; do
      # shellcheck disable=SC2053 - glob match against the pattern is intended
      if [[ $_base == $_pat ]]; then
        _hit=1
        break
      fi
    done
    if ((_hit == 0)); then
      rm -rf "$_f"
      _dropped=$((_dropped + 1))
    fi
  done
  msg2 "pruned %s lib/ entries outside upstream's libc_baselibs" "$_dropped"

  # The loader is the one file the whole payload exists to deliver; a typo in
  # the allowlist above would remove it and the failure would not surface until
  # a consumer's build.
  if [[ ! -e $_tree/lib/ld-linux-x86-64.so.2 || ! -e $_tree/lib/libc.so.6 ]]; then
    error "lib/ prune removed the loader or libc - check the allowlist"
    return 1
  fi

  # Development and documentation content upstream splits into -dev,
  # -staticdev and -pic, none of which uninative-tarball.bb installs. Roughly
  # 1150 of our 1600 payload entries. usr/share/i18n is consumed by the
  # localedef step above, which ran against $_install, so dropping it from the
  # assembled tree costs nothing. usr/lib/*.so are the dev symlinks and linker
  # scripts - libc.so names unrelocated build paths, so it is a booby trap if
  # anything ever puts this directory on a linker search path.
  rm -rf \
    "$_tree/usr/include" \
    "$_tree/usr/share/i18n" \
    "$_tree/usr/share/info" \
    "$_tree/usr/share/locale" \
    "$_tree/usr/lib/audit" \
    "$_tree/usr/lib/getconf" \
    "$_tree/usr/etc/rpc"
  rm -f "$_tree"/usr/lib/*.a "$_tree"/usr/lib/*.o "$_tree"/usr/lib/*.so

  # glibc supplies neither of these and the payload needs both: native SDK
  # binaries link against libstdc++/libgcc_s, and libcrypt/libtirpc/libnsl are
  # the split-out pieces glibc no longer ships. Taken from the host's own
  # packages, which are built against this exact glibc version.
  # libgomp and libatomic are GCC runtime libraries in the same category as
  # libstdc++/libgcc_s: native binaries link against them, glibc does not
  # provide them, and OE stages neither for the native architecture (it builds
  # gcc-runtime for the TARGET only). Under uninative the loader searches just
  # this tree plus each object's RUNPATH, so a missing one is fatal - and both
  # were reached transitively, where DT_RUNPATH does not help, which is why the
  # failures looked unrelated to the libraries themselves:
  #
  #   libgomp.so.1   <- rpm-native's librpmbuild.so/librpmio.so (rpm builds with
  #                     OpenMP). rpmdeps could not start, and since EVERY
  #                     recipe's do_package runs rpmdeps this took out
  #                     base-files, hicolor-icon-theme, linux-libc-headers and
  #                     wayland-protocols in a single run.
  #   libatomic.so.1 <- libcxx-native's libc++.so.1, loaded by gn. Chromium's
  #                     do_configure died with
  #                     "gn: error while loading shared libraries:
  #                      libatomic.so.1" while gn's own DT_NEEDED never
  #                     mentions it.
  # The test for belonging here is whether OE stages the library for native at
  # all. libgomp and libatomic it does not - gcc-runtime is built for the
  # TARGET only - so the payload is the only place they can come from. A
  # library OE *does* stage does NOT belong here even when a binary fails to
  # find it: rust-native's prebuilt snapshot could not load libz.so.1, but
  # zlib-native was staged in that recipe's own recipe-sysroot-native all
  # along and the fix is to point the loader at it (an rpath on the snapshot),
  # not to ship the host's copy. Shipping it would have substituted the host's
  # zlib - zlib-ng-compat on an Arch host - for the zlib OE built, silently,
  # for every native binary without a RUNPATH. That is the contamination
  # uninative exists to prevent.
  #
  # There is no host-library fallback that these "should" have hit. Patch 0003
  # is named "Look for host system ld.so.cache as well", but it only reorders
  # the search so the cache is consulted last; the cache PATH lives in
  # .ldsocache and relocate_sdk.py rewrites it with the tree prefix, so the
  # loader reads <tree>/usr/etc/ld.so.cache - never the host's /etc one. That
  # file exists (glibc's make install runs ldconfig against DESTDIR) and is
  # inert: every entry names an unrelocated build path. Verified on the
  # shipped artifact - every path it names is an unrelocated build path that
  # does not exist. So this list is the whole mechanism for the libraries that
  # belong here, and there is no fallback quietly covering anything else.
  install -Dm755 -t "$_tree/usr/lib" \
    /usr/lib/libstdc++.so.6 \
    /usr/lib/libgcc_s.so.1 \
    /usr/lib/libgomp.so.1 \
    /usr/lib/libatomic.so.1 \
    /usr/lib/libcrypt.so.2 \
    /usr/lib/libtirpc.so.3 \
    /usr/lib/libnsl.so.3

  # libcrypt.so.1 is the pre-libxcrypt ABI. Upstream ships it -
  # uninative-tarball.bb pulls nativesdk-libxcrypt-compat alongside
  # nativesdk-libxcrypt - and since the uninative tree is the loader's entire
  # search scope, a native binary built against the old ABI is an outright
  # load failure rather than something the host can satisfy. Cheap insurance
  # for a payload that is meant to be a drop-in for upstream's.
  install -Dm755 -t "$_tree/usr/lib" /usr/lib/libcrypt.so.1

  # bitbake prepends <tree>/usr/bin to PATH and relocates this binary, so it
  # must exist under that exact name. Its .interp is padded to 1024 bytes
  # because relocate_sdk.py overwrites .interp in place and fails if the
  # replacement path does not fit - the real build path is not known until
  # extraction time.
  install -Dm755 /usr/bin/patchelf "$_tree/usr/bin/patchelf-uninative"
  local _pad
  _pad=$(printf '%*s' 1024 '' | tr ' ' a)
  patchelf --set-interpreter "$_pad" "$_tree/usr/bin/patchelf-uninative"

  # relocate_sdk.py greps for its own old_prefix literal, which oe-core ships
  # as a placeholder for the SDK build to substitute. Substituting it with the
  # prefix glibc was actually configured with is what makes relocation match.
  sed -e "s|##DEFAULT_INSTALL_DIR##|$_sysroot|" \
    "$srcdir/relocate_sdk.py" >"$srcdir/uninative/relocate_sdk.py"
  chmod 755 "$srcdir/uninative/relocate_sdk.py"

  # Assert the loader we built reports the glibc version pkgver claims. If
  # these ever disagree, UNINATIVE_MAXGLIBCVERSION in the fragment below would
  # be a lie and bitbake would either refuse to start or corrupt sstate.
  local _raw _built _claimed
  _raw=$(LC_ALL=C "$_tree/lib/ld-linux-x86-64.so.2" --version 2>&1) || true
  _built=$(printf '%s\n' "$_raw" | head -1 | grep -Po '\d+\.\d+(?=\.?\s*$)') || _built=
  _claimed=${pkgver%%+*}
  if [[ $_built != "$_claimed" ]]; then
    error "built loader reports glibc %s but pkgver claims %s" \
      "${_built:-<no match>}" "$_claimed"
    return 1
  fi
  msg2 "built glibc %s from %s" "$_built" "$_commit"

  ( cd "$srcdir/uninative" && tar -cJf "$srcdir/$_tarball" relocate_sdk.py x86_64-linux )
}

package() {
  # Computed here, not in build(): makepkg re-execs under fakeroot and
  # re-sources this file, discarding anything build() assigned.
  local _sha _glibc
  _sha=$(sha256sum "$srcdir/$_tarball" | cut -d' ' -f1)
  _glibc=${pkgver%%+*}

  install -Dm644 "$srcdir/$_tarball" \
    "${pkgdir}/usr/share/yocto-uninative/mirror/${_tarball}"

  # Because we produce the tarball rather than mirroring the Yocto Project's,
  # UNINATIVE_URL can be pointed straight at the local directory. That removes
  # the PREMIRRORS indirection the mirror-based design needed to reach a
  # checksum-addressed remote layout.
  #
  # No .done stamp is shipped alongside the tarball: uninative.bbclass gates
  # its whole fetch block on that file existing and skips checksum validation
  # when it does. Letting bitbake create it after verifying UNINATIVE_CHECKSUM
  # keeps the verification path intact.
  #
  # Two of these need :forcevariable and two do not, and the difference is not
  # cosmetic. oe-core's yocto-uninative.inc is required from defaultsetup.conf,
  # which bitbake.conf includes *after* local.conf, and it assigns:
  #
  #   UNINATIVE_MAXGLIBCVERSION  = "2.43"   hard '='  -> would overwrite us
  #   UNINATIVE_VERSION          = "5.1"    hard '='  -> would overwrite us
  #   UNINATIVE_URL             ?= "..."    weak '?=' -> our '=' already wins
  #   UNINATIVE_CHECKSUM[x86_64]?= "..."    weak '?=' -> our '=' already wins
  #
  # forcevariable is the last entry in OVERRIDES and resolves when the variable
  # is read rather than when it is parsed, so it beats a later hard assignment.
  # Without it on UNINATIVE_VERSION, UNINATIVE_TARBALL resolves to
  # x86_64-nativesdk-libc-5.1.tar.xz, which is not in the mirror - the fetch
  # fails and uninative silently disables itself with only a bb.warn.
  #
  # No forcevariable on the CHECKSUM line: it is a varflag, and override syntax
  # on a flag is not the same mechanism. The weak '?=' upstream makes it moot.
  install -d "${pkgdir}/usr/share/yocto-uninative"
  {
    printf '%s\n' '# Generated by the yocto-uninative-tarball Arch package.'
    printf 'UNINATIVE_URL = "file:///usr/share/yocto-uninative/mirror/"\n'
    printf 'UNINATIVE_VERSION:forcevariable = "%s"\n' "$pkgver"
    printf 'UNINATIVE_CHECKSUM[x86_64] = "%s"\n' "$_sha"
    printf 'UNINATIVE_MAXGLIBCVERSION:forcevariable = "%s"\n' "$_glibc"
  } >"${pkgdir}/usr/share/yocto-uninative/uninative.inc"

  # The fragment pins UNINATIVE_MAXGLIBCVERSION to the glibc this tarball was
  # built from, and nothing re-checks it afterwards. When the host later moves
  # to a new glibc MINOR, uninative.bbclass disables itself with a bb.warn that
  # is easy to lose in a build log. This hook says so at the moment of the
  # glibc upgrade instead, which is the point where the user can act.
  #
  # A hook rather than an .install: an .install fires when THIS package
  # changes, and the event that invalidates the tarball is glibc changing.
  install -Dm755 "$srcdir/glibc-upgrade-check.sh" \
    "${pkgdir}/usr/share/yocto-uninative/glibc-upgrade-check"
  install -Dm644 "$srcdir/yocto-uninative-glibc.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-yocto-uninative-glibc.hook"
}

# vim:set ts=2 sw=2 et:
