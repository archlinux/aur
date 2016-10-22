# CHANGELOG

## 31 August 2016: `atom-bleeding-1.9.9.apm1.12.6.e1.3.4.n6.4.0-1`
Important changes:
1. Downgraded Node.js from 6.5.0 to 6.4.0, in accordance with upstream bug [FS#50614](https://bugs.archlinux.org/task/50614)
2. Added Node.js version to pkgver.
3. Updates for several key packages.

## 31 August 2016: `atom-bleeding-1.9.9.apm1.12.6.e1.3.4.n6.4.0-2`
Full-length `pkgver` is: `1.9.9.aa1.6.2.ac0.11.2.am1.6.1.ap2.31.2.apm1.12.6.as0.1.0.asn1.11.0.av0.61.1.b0.42.0.bm0.82.2.bt0.26.1.d0.8.9.e.es0.22.0.ff1.4.0.fi1.7.19.fr0.201.1.fu0.12.0.g3.0.6.gd1.1.0.gl0.31.0.gp5.16.2.gs0.48.2.gtm1.5.3.iv0.59.0.l1.11.16.la0.9.1.lc3.4.4.lcs1.0.0.ld1.1.7.les0.5.0.lg0.92.2.lgo0.42.1.lh0.45.1.li1.18.3.lj1.3.0.lja0.24.0.ljs0.120.0.ljso0.18.2.ll1.0.2.lld0.5.1.lle0.29.5.lm0.22.2.lp1.0.0.lph0.37.2.lpl0.35.0.lpy0.45.0.lr0.70.1.lrt0.4.6.ls.lsq0.24.0.lt0.29.0.lu0.37.8.lv0.3.2.lx0.34.10.ly0.27.0.m4.24.7.mp0.158.3.o1.2.0.p0.34.0.s3.9.0.sc0.68.2.sev0.242.0.sg0.47.2.sv0.113.1.t0.101.0.tc0.33.2.tf2.3.1.tv0.209.3.w0.33.0`.
Differences from previous release: `atom-bleeding-1.9.9.apm1.12.6.e1.3.4.n6.4.0-1`
1. Includes the `script` package.
2. Includes changes from upstream commit [4b4df54](https://github.com/tensor5/arch-atom/commit/4b4df547a5c359733e8c5cd5611f9d3ff224ad12).

## 1 September 2016: `atom-bleeding-1.10.0.apm1.12.6.e1.3.4.n6.4.0-1`
Full-length `pkgver` is:
`1.10.0.aa1.6.2.ac0.11.2.am1.6.1.ap2.31.2.apm1.12.6.as0.1.0.asn1.11.0.av0.61.1.b0.42.0.bm0.82.2.bt0.26.1.d0.8.9.e.es0.22.0.ff1.4.0.fi1.7.19.fr0.201.1.fu0.12.0.g3.0.6.gd1.1.0.gl0.31.0.gp5.16.2.gs0.48.2.gtm1.5.3.iv0.59.0.l1.11.16.la0.9.1.lc3.4.4.lcs1.0.0.ld1.1.7.les0.5.0.lg0.92.2.lgo0.42.1.lh0.45.1.li1.18.3.lj1.3.0.lja0.24.0.ljs0.120.0.ljso0.18.2.ll1.0.2.lld0.5.1.lle0.29.5.lm0.22.2.lp1.0.0.lph0.37.2.lpl0.35.0.lpy0.45.0.lr0.70.1.lrt0.4.6.ls.lsq0.24.0.lt0.29.0.lu0.37.8.lv0.3.2.lx0.34.10.ly0.27.0.m4.24.7.mp0.158.3.o1.2.0.p0.34.0.s3.9.0.sc0.68.2.sev0.242.0.sg0.47.2.sv0.113.1.t0.101.0.tc0.33.2.tf2.3.1.tv0.209.3.w0.33.0`
Differences from previous release:
1. New Atom version: 1.10.0.
2. [`package.json`](https://github.com/atom/atom/blob/v1.10.0/package.json) has had the [`atom-ui`](https://github.com/atom/atom-ui) dependency added to it, in order to fix an error encountered due to the [`static/atom.less`](https://github.com/atom/atom/blob/v1.10.0/static/atom.less) file having the line [`@import "../node_modules/atom-ui/atom-ui.less";`](https://github.com/atom/atom/blob/v1.10.0/static/atom.less#L27).

## 1 September 2016: `atom-bleeding-1.10.0.apm1.12.6.e1.3.4-1`
Full-length `pkgver` is:
`1.10.0.aa1.6.2.ac0.11.2.am1.6.1.ap2.31.2.apm1.12.6.as0.1.0.asn1.11.0.av0.61.1.b0.42.0.bm0.82.2.bt0.26.1.d0.8.9.e.es0.22.0.ff1.4.0.fi1.7.19.fr0.201.1.fu0.12.0.g3.0.6.gd1.1.0.gl0.31.0.gp5.16.2.gs0.48.2.gtm1.5.3.iv0.59.0.l1.11.16.la0.9.1.lc3.4.4.lcs1.0.0.ld1.1.7.les0.5.0.lg0.92.2.lgo0.42.1.lh0.45.1.li1.18.3.lj1.3.0.lja0.24.0.ljs0.120.0.ljso0.18.2.ll1.0.2.lld0.5.1.lle0.29.5.lm0.22.2.lp1.0.0.lph0.37.2.lpl0.35.0.lpy0.45.0.lr0.70.1.lrt0.4.6.ls.lsq0.24.0.lt0.29.0.lu0.37.8.lv0.3.2.lx0.34.10.ly0.27.0.m4.24.7.mp0.158.3.o1.2.0.p0.34.0.s3.9.0.sc0.68.2.sev0.242.0.sg0.47.2.sv0.113.1.t0.101.0.tc0.33.2.tf2.3.1.tv0.209.3.w0.33.0`
Differences from previous release:
1. Removed reference to Node.js from `pkgver`.
2. `about-view.js`, removed space after `PKGBUILD`.
