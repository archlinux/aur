# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 Mateusz Okulanis <FPGArtktic@outlook.com>
# Maintainer: Mateusz Okulanis <FPGArtktic at outlook dot com>
#
# PKGBUILD - Arch User Repository recipe for lazysubmodules-git
#
# Builds lazysubmodules from the default branch of the upstream repository
# with the flags of the Arch Linux Go package guidelines, runs the test
# suite, and installs the binary, the short name lsm, the license with the
# notices of the third-party code linked into the binary, and the README.
# The binary contains no paths of the build directory, so there is no debug
# package.
# Dependencies come from the vendor/ directory of the repository, so the
# build downloads no Go modules.
#
# Usage: makepkg -si
#        makepkg --printsrcinfo > .SRCINFO   (after every change)
#
# makepkg reads the variables, sets pkgdir, srcdir and the build flags, and
# runs the functions with errexit, so a failed cd stops the build.
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=lazysubmodules-git
_pkgname=lazysubmodules
pkgver=0.1.0rc1.r0.gdd57e1b
pkgrel=1
pkgdesc='Track git submodules by branch, tag, tag pattern or commit'
arch=('x86_64' 'aarch64')
url='https://github.com/FPGArtktic/lazysubmodules'
# The project, then the licenses of the Go modules linked into the binary
# (see THIRD_PARTY_NOTICES).
license=('GPL-3.0-only AND BSD-3-Clause AND MIT')
depends=('git' 'glibc')
# The VCS package guidelines list git here as well, for the source and
# pkgver(); namcap then reports it as redundant.
makedepends=('git' 'go' 'go-licenses')
# ssh-keygen, for the tests of SSH-signed tags.
checkdepends=('openssh')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# -trimpath leaves debugedit no source paths to collect, so a debug package
# would hold no sources.
options=('!debug')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

# Release tags are annotated and named vX.Y.Z or vX.Y.Z-rc.N. A pre-release
# loses its separators (0.1.0-rc.1 becomes 0.1.0rc1), so that vercmp sorts
# it below the release: 0.1.0rc1.r5.g1234abc < 0.1.0.r0.g5678def. Before the
# first release tag the version is r<commit count>.<commit>.
pkgver()
{
	local desc count tag base pre

	cd "${_pkgname}"
	if ! desc="$(git describe --long --abbrev=7 --match 'v[0-9]*' 2>/dev/null)"; then
		count="$(git rev-list --count HEAD)"
		desc="$(git rev-parse --short=7 HEAD)"
		printf 'r%s.%s\n' "${count}" "${desc}"
		return
	fi
	desc="${desc#v}"
	count="${desc%-g*}"
	tag="${count%-*}"
	count="${count##*-}"
	base="${tag%%-*}"
	pre="${tag#"${base}"}"
	printf '%s%s.r%s.g%s\n' "${base}" "${pre//[^[:alnum:]]/}" "${count}" "${desc##*-g}"
}

build()
{
	local commit commit_time commit_date

	cd "${_pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	# -trimpath keeps the paths of the build directory out of the binary.
	export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -modcacherw'
	# Build with the installed Go only, and never download modules.
	export GOTOOLCHAIN=local GOPROXY=off
	commit="$(git rev-parse HEAD)"
	# The date of the commit, not of the build, as in the release binaries:
	# a rebuild of the same commit gives the same binary.
	commit_time="$(git show -s --format=%ct HEAD)"
	commit_date="$(date -u -d "@${commit_time}" '+%Y-%m-%dT%H:%M:%SZ')"
	go build -o build/ -ldflags "-linkmode=external -extldflags '${LDFLAGS}' \
		-X main.version=${pkgver} -X main.commit=${commit} -X main.date=${commit_date}" \
		./cmd/lazysubmodules
	# THIRD_PARTY_NOTICES and licenses/ for the modules in the binary.
	scripts/third-party-licenses.sh -o build/third-party
}

check()
{
	cd "${_pkgname}"
	export GOPATH="${srcdir}"
	export GOFLAGS='-mod=vendor -modcacherw'
	export GOTOOLCHAIN=local GOPROXY=off
	go test ./...
}

package()
{
	local licenses="${pkgdir}/usr/share/licenses/${pkgname}"

	cd "${_pkgname}"
	install -Dm755 build/lazysubmodules "${pkgdir}/usr/bin/lazysubmodules"
	ln -s lazysubmodules "${pkgdir}/usr/bin/lsm"
	install -Dm644 -t "${licenses}" LICENSE build/third-party/THIRD_PARTY_NOTICES
	cp -r --no-preserve=mode,ownership build/third-party/licenses "${licenses}/"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
