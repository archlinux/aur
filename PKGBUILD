# Maintainer: HanHaocheng <1849397656@qq.com>
#
# Why this is a -bin package with a private virtualenv:
#
# Upstream (volcengine/OpenViking) declares roughly 160 Python dependencies.
# Six of them are exact `==` pins that cannot coexist with the versions already
# shipped by the official repositories / AUR:
#
#     tree-sitter==0.25.2                (AUR: 0.26.0)
#     tree-sitter-language-pack==1.13.3  (AUR: 0.13.0)
#     tree-sitter-rust==0.24.0           (AUR: 0.24.2)
#     tree-sitter-php==0.24.1            (AUR: 0.24.2)
#     tree-sitter-c-sharp==0.23.1        (AUR: 0.23.5)
#     litellm>=1.83.7,<1.91.2            (AUR: 1.102.0)
#
# and five more are packaged nowhere (openviking-sdk, firecrawl-anydoc,
# json-repair, volcengine, volcengine-python-sdk).  A system-package based
# PKGBUILD is therefore impossible, so the upstream dependency set is resolved
# into a private virtualenv under /opt.  Requires network access during build().
#
# NOTE: rebuild this package after every Python minor version upgrade.

_ovname=openviking
_prefix=/opt/$_ovname
_venv=$_prefix/venv

pkgname=openviking-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Self-evolving context database for AI agents (upstream wheel with a private virtualenv)"
arch=('x86_64' 'aarch64')
url="https://github.com/volcengine/OpenViking"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'python')
provides=("$_ovname")
conflicts=("$_ovname" 'openviking-cli')
options=('!strip' '!debug')
install="$pkgname.install"

# Depends on $pkgver, so it must be expanded after it is set.
_wheel=$_ovname-$pkgver-cp310-abi3-manylinux_2_31_$CARCH.whl

source=("$_ovname.service"
        "$_ovname.sysusers")
sha256sums=('SKIP'
            'SKIP')

source_x86_64=("openviking-0.5.4-cp310-abi3-manylinux_2_31_x86_64.whl::https://files.pythonhosted.org/packages/26/b1/8782be0d1013b0cdd549be1a86e23c858d41c7386d52e3d0e7094842f3e5/openviking-0.5.4-cp310-abi3-manylinux_2_31_x86_64.whl")
sha256sums_x86_64=('90a785466f8199580ac1b8e8a7fb5c6988beacef50197e912e6e6ba0cbe91eae')

source_aarch64=("openviking-0.5.4-cp310-abi3-manylinux_2_31_aarch64.whl::https://files.pythonhosted.org/packages/ac/f1/65317dc158714c71b168b7372507ee984c3e667f3e069cb4f1e1c8ef0af0/openviking-0.5.4-cp310-abi3-manylinux_2_31_aarch64.whl")
sha256sums_aarch64=('866d9dc71f8683ba6fecbdee193a0a6ee5873da51d669ca5a13fbc4d7f8cc72e')

build() {
    python -m venv --clear "$srcdir/venv"

    # Resolve the upstream dependency set into the venv.  The wheel itself is
    # checksum-verified by makepkg; its transitive dependencies come from PyPI.
    "$srcdir/venv/bin/python" -m pip install \
        --no-cache-dir \
        --disable-pip-version-check \
        --no-warn-script-location \
        --upgrade-strategy only-if-needed \
        "$srcdir/$_wheel"
}

package() {
    install -dm755 "$pkgdir$_prefix"

    cp -a "$srcdir/venv" "$pkgdir$_prefix/venv"

    # The venv was created under $srcdir, so every generated console script
    # carries a shebang (and the activate scripts a VIRTUAL_ENV) pointing into
    # the build directory.  Rewrite them to the final /opt location.
    find "$pkgdir$_venv/bin" -type f -exec sed -i "s|$srcdir/venv|$_venv|g" {} +
    sed -i "s|$srcdir/venv|$_venv|g" "$pkgdir$_venv/pyvenv.cfg"

    # CPython adds a decorative "𝜋thon" (U+1D70B, mathematical italic small pi)
    # symlink next to python when it creates a venv on a UTF-8 filesystem.  Such
    # a non-ASCII pathname cannot always be encoded by bsdtar under a C locale,
    # which makes the build depend on the ambient locale.  Nothing uses that
    # alias, so drop it and keep the package contents deterministic.
    rm -f "$pkgdir$_venv/bin/𝜋thon"

    # Entry points.  A wrapper rather than a plain symlink, so that a stale
    # venv (after a Python minor upgrade) fails with an actionable message
    # instead of a bare ModuleNotFoundError.
    local _cmd
    for _cmd in openviking openviking-server ov vikingbot; do
        cat > "$srcdir/$pkgname.$_cmd" <<'EOS'
#!/bin/sh
# openviking-bin: run @CMD@ from the private virtualenv in @VENV@.
_venv=@VENV@
_pyver=$("$_venv/bin/python" -c 'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null)
if [ ! -d "$_venv/lib/python$_pyver/site-packages/openviking" ]; then
	printf '%s\n' \
		"openviking: the private virtualenv in $_venv does not match the running Python ${_pyver:-?}." \
		"Rebuild openviking-bin after a Python upgrade, e.g.: paru -S openviking-bin" >&2
	exit 1
fi
exec "$_venv/bin/@CMD@" "$@"
EOS
        sed -i -e "s|@VENV@|$_venv|g" -e "s|@CMD@|$_cmd|g" "$srcdir/$pkgname.$_cmd"

        install -Dm755 "$srcdir/$pkgname.$_cmd" "$pkgdir/usr/bin/$_cmd"
    done

    install -Dm644 "$srcdir/$_ovname.service" \
        "$pkgdir/usr/lib/systemd/system/$_ovname.service"
    install -Dm644 "$srcdir/$_ovname.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/$_ovname.conf"
}
