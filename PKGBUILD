# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-fermi-reclock-dkms
_pkgname=nouveau-fermi-reclock
pkgver=1.0.4
pkgrel=1
pkgdesc="Unified Nouveau out-of-tree module with Fermi core/shader reclocking (DKMS)"
arch=('x86_64')
url="https://github.com/Twilight0/nouveau-fermi-reclock-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'python')
source=(
  "https://github.com/Twilight0/nouveau-fermi-reclock-dkms/releases/download/v${pkgver}/nouveau-source.tar.gz"
  "nouveau-fermi-reclock.patch"
  "dkms.conf"
  "nouveau-fermi-reclock.conf"
  "nouveau-dynclockd.py"
  "nouveau-dynclockd.service"
  "nouveau-ctrl"
)
sha256sums=('1426cea7f5c4959cfcaec78b4974cde3071f51eb9fdf9beedf38efae0bc6b9ad'
            '81c9bdc347770d16133cd492b06a5838f2d53fbd08f73667567a7c2a89648b4b'
            'e18bc5f217f6562d270f5ad5c0ae10f40ed83a2a52ab52724583e253a2a2f9ce'
            '6071288d33dc5d9892a39cd1030c6af919bab437a3bd579be21350f3cc192737'
            '45f2dce5fed26507b4d5ca8d554bbf47026aa2baac6831bc867107334c768ff0'
            '92911764e6fe601af3599a9e0fb95b48fe6109be6208d4150fa762f17c32c7fa'
            '4e87c6694b57f82a28fc0932d4af310f85323816902e0f8e1913b698a8593be9')

prepare() {
  msg2 "Applying Fermi reclocking and backlight patches..."
  patch -Np1 -d "${srcdir}/nouveau-source" < "${srcdir}/nouveau-fermi-reclock.patch"

  # Shader clock display fix (local only, not upstream) — Python is safer than sed on the 2-line gpc entry
  python3 <<PY
import pathlib
p = pathlib.Path("${srcdir}/nouveau-source/nvkm/subdev/clk/gf100.c")
t = p.read_text()
old = '\t\t{ nv_clk_src_gpc    , 0x03, NVKM_CLK_DOM_FLAG_CORE |\n\t\t\t\t\t    NVKM_CLK_DOM_FLAG_VPSTATE, "core", 2000 },'
new = '\t\t{ nv_clk_src_gpc    , 0x03, NVKM_CLK_DOM_FLAG_CORE |\n\t\t\t\t\t    NVKM_CLK_DOM_FLAG_VPSTATE, "core", 2000 },\n\t\t{ nv_clk_src_shader , 0xff, 0, "shader", 1000 },'
t = t.replace(old, new)
old2 = '\tcase nv_clk_src_gpc:\n\t\treturn read_clk(clk, 0x00);'
new2 = '\tcase nv_clk_src_gpc:\n\t\treturn read_clk(clk, 0x00);\n\tcase nv_clk_src_shader:\n\t\treturn read_clk(clk, 0x00);'
t = t.replace(old2, new2)
p.write_text(t)
PY
  # VRAM DDR3 VBlank sync — wait for vblank before DDR3 MEMX (local, not upstream)
  python3 <<PY
import pathlib
p = pathlib.Path("${srcdir}/nouveau-source/nvkm/subdev/fb/ramgf100.c")
t = p.read_text()
# Insert vblank wait before DDR3 0x10f824 write in the 0f pstate path
old = "\t\tif (ram->base.type == NVKM_RAM_TYPE_DDR3) {\n\t\t\tram_wr32(fuc, 0x10f824, 0x00021e67);"
new = "\t\tif (ram->base.type == NVKM_RAM_TYPE_DDR3) {\n\t\t\t/* VBlank sync for DDR3 900 on eDP 120Hz — local */\n\t\t\tint i; for (i = 0; i < 100; i++) { if (nvkm_rd32(device, 0x6100b0) & 0x00000001) break; ram_nsec(fuc, 100); }\n\t\t\tram_wr32(fuc, 0x10f824, 0x00021e67);"
t = t.replace(old, new, 1)
p.write_text(t)
PY
  # base.c: shader fallback (post-override)
  python3 <<PY
import pathlib
p = pathlib.Path("${srcdir}/nouveau-source/nvkm/subdev/clk/base.c")
t = p.read_text()
old = "\t\tcstate->domain[domain->name] = perfS.v40.freq;\n\t}\n"
new = "\t\tcstate->domain[domain->name] = perfS.v40.freq;\n\t}\n\t/* shader = hot clock (2x core) if VBIOS omits it */\n\tif (!cstate->domain[nv_clk_src_shader])\n\t\tcstate->domain[nv_clk_src_shader] = cstate->domain[nv_clk_src_gpc];\n"
if old in t:
    t = t.replace(old, new, 1)
p.write_text(t)
PY
  # base.c: fix 0f undervoltage — force 1030mV (0x67 -> id*10000 fallback = 1030000uV)
  python3 <<PY
import pathlib
p = pathlib.Path("${srcdir}/nouveau-source/nvkm/subdev/clk/base.c")
t = p.read_text()
old = "\tcstate->voltage = perfE.voltage;\n"
new = "\tcstate->voltage = perfE.voltage;\n\tif (pstate->pstate == 0x0f)\n\t\tcstate->voltage = 0x67;\n"
if old in t:
    t = t.replace(old, new, 1)
p.write_text(t)
PY
  # base.c: OC pstate 0x10 (700/1400/900), gated by NvFermiOC module option (default off)
  python3 <<PY
import pathlib
p = pathlib.Path("${srcdir}/nouveau-source/nvkm/subdev/clk/base.c")
t = p.read_text()
old = "\tclk->state_nr++;\n\treturn 0;\n}"
new = "\tclk->state_nr++;\n\n\t/* Local OC pstate (5th, beyond BIOS max 0f) — gated by NvFermiOC */\n\tif (pstate->pstate == 0x0f && nvkm_boolopt(clk->subdev.device->cfgopt, \"NvFermiOC\", false)) {\n\t\tstruct nvkm_pstate *oc = kzalloc(sizeof(*oc), GFP_KERNEL);\n\t\tif (oc) {\n\t\t\tINIT_LIST_HEAD(&oc->list);\n\t\t\toc->pstate = 0x10;\n\t\t\toc->fanspeed = pstate->fanspeed;\n\t\t\toc->pcie_speed = pstate->pcie_speed;\n\t\t\toc->pcie_width = pstate->pcie_width;\n\t\t\toc->base = pstate->base;\n\t\t\toc->base.domain[nv_clk_src_gpc] = 1400000;\n\t\t\toc->base.domain[nv_clk_src_shader] = 1400000;\n\t\t\tnvkm_pstate_info(clk, oc);\n\t\t\tlist_add_tail(&oc->head, &clk->states);\n\t\t\tclk->state_nr++;\n\t\t}\n\t}\n\n\treturn 0;\n}"
if old in t:
    t = t.replace(old, new, 1)
p.write_text(t)
PY
  # Replace @PKGVER@ in dkms.conf
  sed "s/@PKGVER@/${pkgver}/g" -i "${srcdir}/dkms.conf"
}

package() {
  local destdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -d "${destdir}"
  
  # Copy pre-patched sources directly to the DKMS build directory
  cp -r "${srcdir}/nouveau-source/"* "${destdir}/"
  
  # Install dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${destdir}/dkms.conf"

  # Install default modprobe configuration
  install -Dm644 "${srcdir}/nouveau-fermi-reclock.conf" "${pkgdir}/usr/lib/modprobe.d/nouveau-fermi-reclock.conf"

  # Install the dynamic clock daemon
  install -Dm755 "${srcdir}/nouveau-dynclockd.py" "${pkgdir}/usr/bin/nouveau-dynclockd.py"

  # Install systemd service
  install -Dm644 "${srcdir}/nouveau-dynclockd.service" "${pkgdir}/usr/lib/systemd/system/nouveau-dynclockd.service"

  # Install CLI management utility
  install -Dm755 "${srcdir}/nouveau-ctrl" "${pkgdir}/usr/bin/nouveau-ctrl"
}
