# Maintainer: Gvol <gvol@nexusystems.org>
# https://github.com/Gvolexe/GvolTools

pkgname=gvoltools
pkgver=1.2.4
pkgrel=1
pkgdesc="A collection of SSH management and system administration tools"
arch=('any')
url="https://github.com/Gvolexe/GvolTools"
license=('MIT')
depends=(
    'python>=3.10'
    'python-paramiko'
    'python-cryptography'
)
optdepends=(
    'openssh: for SSH key management'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gvolexe/GvolTools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/GvolTools-${pkgver}"
    
    # Install shared library to Python site-packages
    local python_version=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    install -Dm644 tools/gvcore/files/gvcore.py "${pkgdir}/usr/lib/python${python_version}/site-packages/gvcore.py"
    
    # Install main binaries
    for tool_dir in tools/*/; do
        tool_name=$(basename "$tool_dir")
        
        # Skip gvcore (it's a library, not a CLI tool)
        [[ "$tool_name" == "gvcore" ]] && continue
        
        main_file="${tool_dir}files/${tool_name}.py"
        if [[ -f "$main_file" ]]; then
            install -Dm755 "$main_file" "${pkgdir}/usr/bin/${tool_name}"
        fi
    done
    
    # Create aliases via symlinks
    cd "${pkgdir}/usr/bin"
    
    # gv aliases
    ln -sf gv gvtools
    
    # gvfleet aliases: fleet, f, gvf
    ln -sf gvfleet fleet
    ln -sf gvfleet f
    ln -sf gvfleet gvf
    
    # gvsshprofile aliases: sp, gvsp
    ln -sf gvsshprofile sp
    ln -sf gvsshprofile gvsp
    
    # gvolkeymanager aliases: km, gvkm
    ln -sf gvolkeymanager km
    ln -sf gvolkeymanager gvkm
    
    # gvhostbootstrap aliases: hb, gvhb
    ln -sf gvhostbootstrap hb
    ln -sf gvhostbootstrap gvhb
    
    # gvsshaudit aliases: sa, sshaudit, gvsa
    ln -sf gvsshaudit sa
    ln -sf gvsshaudit sshaudit
    ln -sf gvsshaudit gvsa
    
    # gvknownhostsctl aliases: kh, gvkh
    ln -sf gvknownhostsctl kh
    ln -sf gvknownhostsctl gvkh
    
    # gvsecretsync aliases: sec, secrets, gvs (ss conflicts with iproute2)
    ln -sf gvsecretsync sec
    ln -sf gvsecretsync secrets
    ln -sf gvsecretsync gvs
    
    # gvcertctl aliases: cert, gvcert (cc conflicts with gcc)
    ln -sf gvcertctl cert
    ln -sf gvcertctl gvcert
    
    # gvfirewallctl aliases: fw, gvfw
    ln -sf gvfirewallctl fw
    ln -sf gvfirewallctl gvfw
    
    # gvupdates aliases: upd, gvu
    ln -sf gvupdates upd
    ln -sf gvupdates gvu
    
    # gvsudoauth aliases: su, sudoauth, gvsu (su might conflict, but rare)
    ln -sf gvsudoauth sudoauth
    ln -sf gvsudoauth gvsu
    
    # gvlogtriage aliases: lt, logtriage, gvlt
    ln -sf gvlogtriage lt
    ln -sf gvlogtriage logtriage
    ln -sf gvlogtriage gvlt
    
    # gvbackupctl aliases: bk, gvbk (backup conflicts with tar)
    ln -sf gvbackupctl bk
    ln -sf gvbackupctl gvbk
    
    # gvdnscheck aliases: dns, dc, gvdns
    ln -sf gvdnscheck dns
    ln -sf gvdnscheck dc
    ln -sf gvdnscheck gvdns
    
    # gvnetdiag aliases: nd, netdiag, gvnd (net conflicts with smbclient)
    ln -sf gvnetdiag nd
    ln -sf gvnetdiag netdiag
    ln -sf gvnetdiag gvnd
    
    # gvportsentry aliases: ports, gvps
    ln -sf gvportsentry ports
    ln -sf gvportsentry gvps
    
    # gvdotctl aliases: dt, dot, gvdt
    ln -sf gvdotctl dt
    ln -sf gvdotctl dot
    ln -sf gvdotctl gvdt
    
    # gvgitopsinit aliases: gi, gitops, gvgi
    ln -sf gvgitopsinit gi
    ln -sf gvgitopsinit gitops
    ln -sf gvgitopsinit gvgi
    
    # gvpermcheck aliases: pc, perm, gvpc
    ln -sf gvpermcheck pc
    ln -sf gvpermcheck perm
    ln -sf gvpermcheck gvpc
    
    # Install license
    cd "${srcdir}/GvolTools-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
    
    # Install docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 OVERVIEW.md "${pkgdir}/usr/share/doc/${pkgname}/OVERVIEW.md" 2>/dev/null || true
}
