# Maintainer: Javier Tia <floss@jetm.me>

pkgname=yocto-uninative-tarball
# Tracks Arch's glibc exactly, in Arch's own pkgver shape:
# <glibc>+r<commits past tag>+g<12-char sha>. Building from the same commit
# Arch ships is the whole point: it makes the tarball's glibc and the host's
# glibc the same build, so the uninative-vs-host version check below can never
# be a judgement call. update-version.sh rewrites pkgver and _commit together
# from Arch's packaging PKGBUILD; neither is hand-maintained.
pkgver=2.44+r5+g7cba77790f32
_commit=7cba77790f3279bec3ac20e9c7632b021cd53f95
pkgrel=1
pkgdesc='Yocto uninative libc tarball built from the glibc commit Arch ships'
arch=('x86_64')
url='https://git.openembedded.org/openembedded-core/tree/meta/classes-global/uninative.bbclass'
# glibc itself is LGPL-2.1-or-later. The assembled payload also carries
# libgcc_s and libstdc++ (GPL-3.0-or-later WITH GCC-exception-3.1), libcrypt
# (LGPL-2.1-or-later), libtirpc (BSD-3-Clause) and relocate_sdk.py (GPL-2.0-only).
license=('LGPL-2.1-or-later' 'GPL-3.0-or-later WITH GCC-exception-3.1'
         'BSD-3-Clause' 'GPL-2.0-only')
# libstdc++ and libgcc, not gcc-libs: Arch split those shared objects out of
# gcc-libs, and build() copies the .so files directly rather than linking.
makedepends=('git' 'python' 'bison' 'patchelf' 'linux-api-headers'
             'libstdc++' 'libgcc' 'libxcrypt' 'libtirpc' 'libnsl')
# glibc must not be built with LTO, and the payload is assembled by hand in
# build() - makepkg must not strip or split debug info out of the tarball's
# contents on its way into the package.
options=('staticlibs' '!lto' '!strip' '!debug')

# sourceware.org is the upstream of record and is what Arch's own PKGBUILD
# fetches. git.launchpad.net is used here only because sourceware has been
# unreachable; it is a SHA-identical mirror, and #commit= pins the content
# cryptographically, so which host serves the bytes cannot change what is built.
_glibc_url='https://git.launchpad.net/glibc'

# The prefix baked into the loader at build time. relocate_sdk.py rewrites it
# in .sysdirs and .interp when bitbake extracts the tarball, so this literal is
# never used as a real path - it only has to match what relocate_sdk.py greps
# for. Keep it identical to OE's SDKPATH or relocation silently finds nothing.
_sdkpath=/usr/local/oe-sdk-hardcoded-buildpath
_sysroot=$_sdkpath/sysroots/x86_64-pokysdk-linux

_tarball="x86_64-nativesdk-libc-${pkgver}.tar.xz"

source=(
  "glibc::git+${_glibc_url}#commit=${_commit}"
  '0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch'
  '0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch'
  '0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch'
  '0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch'
  '0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch'
  'relocate_sdk.py'
)
# SKIP applies to the git source only: #commit= already pins it by hash.
sha256sums=('SKIP'
            '51b37918062f74052a336bc2afa9567b4f93b37afc9ace7e9195dec9f1c5efcb'
            'dbc290164d623daab992c92264f5dd12c40202da43dcade9c10706d25da4ce60'
            'c21269c1b1c12dd9c59ca71a5bf1df7bd3d2359e38003e198fcfae479a617f5d'
            'd3902264bb4ded821fbc3dd1dba045c6335f27b68af444179b48a9387a54ea12'
            'c2653e464b775f492d88f33561fff9f6648faa0d870554991bb5ee959a5dcb69'
            'f99662254a8ccfb87b2cbea8677d7bef29b452158e036123a64453ee71cc6288')

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
  local _p
  for _p in "$srcdir"/000[34567]-nativesdk-glibc-*.patch; do
    msg2 "applying %s" "$(basename "$_p")"
    patch -p1 -i "$_p"
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
  CFLAGS=${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}

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

  # glibc supplies neither of these and the payload needs both: native SDK
  # binaries link against libstdc++/libgcc_s, and libcrypt/libtirpc/libnsl are
  # the split-out pieces glibc no longer ships. Taken from the host's own
  # packages, which are built against this exact glibc version.
  # libgomp: rpm-native's librpmbuild.so and librpmio.so carry a DT_NEEDED on
  # libgomp.so.1 (rpm builds with OpenMP). Under uninative the loader searches
  # only this tree plus RUNPATH, so without it rpmdeps dies with
  #   rpmdeps: error while loading shared libraries: libgomp.so.1
  # and since EVERY recipe's do_package runs rpmdeps, a single missing library
  # fails unrelated recipes wholesale - observed taking out base-files,
  # hicolor-icon-theme, linux-libc-headers and wayland-protocols in one run.
  # Same category as libstdc++/libgcc_s below: a GCC runtime library that
  # native binaries link against and glibc does not provide.
  install -Dm755 -t "$_tree/usr/lib" \
    /usr/lib/libstdc++.so.6 \
    /usr/lib/libgcc_s.so.1 \
    /usr/lib/libgomp.so.1 \
    /usr/lib/libcrypt.so.2 \
    /usr/lib/libtirpc.so.3 \
    /usr/lib/libnsl.so.3

  # bitbake prepends <tree>/usr/bin to PATH and relocates this binary, so it
  # must exist under that exact name. Its .interp is padded to 1024 bytes
  # because relocate_sdk.py overwrites .interp in place and fails if the
  # replacement path does not fit - the real build path is not known until
  # extraction time.
  install -Dm755 /usr/bin/patchelf "$_tree/usr/bin/patchelf-uninative"
  local _pad
  _pad=$(printf 'a%.0s' $(seq 1 1024))
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
}

# vim:set ts=2 sw=2 et:
