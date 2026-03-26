# Changelog

All notable changes to the MediaTek MT7927 DKMS package are documented here.

Format: `v<pkgver>-<pkgrel>` where pkgver bumps for driver/patch changes
and pkgrel bumps for PKGBUILD packaging changes.

## [2.9-1] - 2026-03-26

### Driver

- Split BT monolithic patch into 8 per-commit patches (matching upstream series)
- Scope CHIPID workaround to VID/PID table (per Sean Wang's review)
- Rename BT firmware path from mt6639/ to mt7927/ (per upstream convention)
- Add MODULE_FIRMWARE declaration for initramfs discovery
- Add Nitin Gurram's Tested-by for MSI X870E Ace Max (0489:e110)
- Bump kernel source to 6.19.10

### Scripts

- Add build-check.sh: verify each commit in a series builds independently
- test-driver: require root, add BT module checks, improve reload robustness
- test-driver: wait for firmware init and NetworkManager reconnection after reload
- release.sh: handle pre-set version without failing on empty commit

### Packaging

- Fix RPM spec: BT firmware path mt6639 -> mt7927

## [2.8-1] - 2026-03-25

### Driver

- Add CHIPID=0x0000 workaround for MT6639 BT firmware
- Update BT patch with ISO interface fix and hunk corrections
- Refine MT7927 WiFi patch series for upstream submission correctness
- Extend airoha_offload.h compat stub with DMA descriptor types

### Scripts

- Add gen-dkms-patches.sh --rebase flag for automated DKMS branch updates
- Add verify-patches.sh: per-file polarity-aware cross-check with staleness detection
- Add version consistency check (make check-version)
- gen-dkms-patches.sh: auto-detect upstream branch via git for-each-ref
- push-aur.sh: filter by blob type instead of named exclusions
- release.sh: remove install file dependency, reorder push sequence
- test-driver: add missing BT USB ID 0489:e110

### Packaging

- Avoid hardcoded version in dkms pre_remove hook
- RPM: derive version from dkms.conf instead of hardcoding in spec

### Documentation

- Clarify MLO status and add router configuration advice

## [2.7-1] - 2026-03-20

### Driver

- Add airoha_offload.h compat stub for kernels 6.17-6.18

### Packaging

- Bump to v2.7 with compat header fix

### Other

- Add push-aur.sh for filtered AUR pushes
- Update README for v2.6 release

## [2.6-1] - 2026-03-20

### Driver

- Fix false PASSED result in test-driver.sh when checks actually fail

### Packaging

- Add RPM and DEB packaging (make rpm, make deb)
- Add GitHub Actions release workflow for automated builds on tag push
- Bump to v2.6 (kernel 6.19.9)

### Documentation

- Add AI attribution note
- Add Gigabyte Z790 Elite X WiFi7 and MSI X870E ACE MAX to supported hardware
- Add distro-agnostic install instructions and community ports

## [2.5-1] - 2026-03-19

### Driver

- Refactor patch series for upstream submission

### Other

- release: Validate remote URLs before push

## [2.4-1]

### Driver

- Add USB ID 0489:e110 for MSI X870E Ace Max

### Packaging

- Distro-agnostic Makefile-based build system (make download, make sources, make install)

### Other

- Add automated release script
- Update README with known issues, fixes, and upstream status

## [2.3-1] - 2026-03-06

### Driver

- Remove GitHub reporter/tester attribution from ASPM patch
- Rebase patch series onto updated kernel tree

### Other

- Exclude .github/ from AUR pushes (server-side hook rejects subdirectories)

## [2.2-1] - 2026-03-06

### Driver

- Add WiFi modules and auto-download support
- Add MT6639/MT7927 WiFi support via mt7925e driver patches
- Add 320MHz EHT bandwidth support
- Fix stale pointer comparisons in MLO link teardown
- Add USB IDs: 13d3:3588 (ASUS X870E-E), 0489:e116 (TP-Link TBE550E)
- Add Tested-by tags from community testers

### Packaging

- Switch to kernel tarball for source (avoid kernel.org CGI rate limits)
- Rename mt6639 to mt7927 in patches, PKGBUILD, and scripts

### Testing

- Add EHT/WiFi 7 capability and channel width checks
- Improve data path check robustness and failure tracking

### Documentation

- Add CHANGELOG, roadmap, and supported hardware table
- Add Gigabyte X870E Aorus Master X3D to supported hardware
