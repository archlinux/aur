# Changelog
## [1:615.78.08-5] - 2026-10-11

### Added
- Expose NVIDIA's per-GPU external classification in procfs and use it to target eGPU process cleanup without selecting internal NVIDIA GPUs

### Changed
- Enable NVIDIA module unloading and process termination by default; configure them independently in `/etc/nvidia.env`
- Document the per-device `RmForceExternalGpu` override scoped to the eGPU's PCI BDF

### Fixed
- Record the NVIDIA device minor and DRM render node names by BDF for external GPUs, targeting only recorded GPUs that disappeared without guessing from device order
- Match open `/dev/nvidiaN` and DRM render nodes, while skipping render node names reassigned to another device
- Keep each last-known minor in `/run` so cleanup can still identify open device files after procfs removes the GPU entry; refresh the record on reconnect
- Replace each per-GPU record atomically and remove the separate state lock
- Recheck device-minor ownership before signaling processes and batch SIGTERM/SIGKILL across removed GPUs
- Give each Thunderbolt removal event its own worker and serialize cleanup with one shared lock
- Trigger cleanup from Thunderbolt device removal while keeping PCI add events for module loading
- Wait up to 30 seconds for PCI removal to finish after the initial five-second settle delay
- Check for remaining or reconnected NVIDIA GPUs once before each unload attempt
- SIGKILL NVIDIA device users and wait five seconds before recounting GPUs
- Return an empty PID list when no process has an NVIDIA device file open

## [1:615.78.08-4] - 2026-10-11

### Added
- Added opt-in sibling-bridge removal before NVIDIA module loading for eGPU ReBAR allocation, with PCI rescan after module loading and on final unload

## [1:615.78.08-3] - 2026-10-11

### Fixed
- Clean up BAR1 mapping reuse state after unmap and allocation failures
- Avoid pinning a reused BAR1 mapping when allocation of its result record fails
- Return expected mapping failures without triggering assertions
- Preserve normal ReBAR attempts and continue probing with the PCI-assigned BAR allocation if resizing fails
- Reclaimed untracked BAR1 virtual address space when an unmap encounters an unrelated tracked range
- Kept kernel RM clients' user BAR1 mappings contiguous while preserving discontiguous mappings for ordinary userspace clients

## [1:615.78.08-2] - 2026-10-11

### Added
- Added post-install notes for internal-GPU modprobe conflicts, forced external-GPU mode, and process-termination settings
- Documented `NVreg_RmForceExternalGpu=1` for Thunderbolt 4/5 enclosures not in the driver's approved bridge list
- Added opt-in process termination through `NVIDIA_EGPU_KILL_PROCESSES` in `/etc/nvidia.env`

### Changed
- Blacklisted NVIDIA and Nouveau module aliases so the eGPU udev handler controls module loading
- Try module unload up to three times, waiting 10 seconds between attempts and aborting if an NVIDIA GPU reappears; process termination remains opt-in

## [1:615.78.08-1] - 2026-10-11

### Changed
- Updated the NVIDIA open kernel module source to 615.78.08 (released upstream on 2026-10-07)
- Refreshed the Thunderbolt eGPU hotplug patchset for the 615.78.08 source tree
- Included upstream Linux 7.3 and DRM atomic-helper compatibility updates

## [1:615.71.09-1] - 2026-09-14

### Changed
- Updated the source base to NVIDIA open kernel modules 615.71.09
- Rebased the hotplug patchset and adjusted GCC SLS patch context for the new source

## [1:610.57.04-1] - 2026-08-14

### Changed
- Updated the source base to NVIDIA open kernel modules 610.57.04
- Refreshed the Thunderbolt eGPU hotplug patch for the new source

## [1:610.43.03-2] - 2026-08-03

### Fixed
- Fixed a use-after-free during surprise GPU removal

## [1:610.43.03-1] - 2026-07-14

### Changed
- Updated the source base to NVIDIA open kernel modules 610.43.03
- Refreshed the hotplug patch for the new source

## [1:610.43.02-2] - 2026-06-02

### Fixed
- Fixed a newly identified null-pointer exception in the eGPU hotplug path

## [1:610.43.02-1] - 2026-06-02

### Changed
- Updated the source base to NVIDIA open kernel modules 610.43.02
- Refreshed the Thunderbolt eGPU hotplug patch for the new source

## [1:595.71.05-1] - 2026-05-24

### Changed
- Updated the source base to NVIDIA open kernel modules 595.71.05

## [1:595.58.03-1] - 2026-03-27

### Changed
- Updated base to NVIDIA open kernel modules 595.58.03
- Refreshed Thunderbolt eGPU hotplug patchset for 595.58.03 to be compatible

## [1:590.48.01-3] - 2026-03-11

### Fixed
- Fixed a follow-up module build failure after the Linux 6.19.6 compatibility update

## [1:590.48.01-2] - 2026-03-11

### Fixed
- Added module build compatibility with Arch kernel 6.19.6-arch1-1.1

## [1:590.48.01-1] - 2025-12-19

### Changed
- Updated the source base to NVIDIA open kernel modules 590.48.01
- Refreshed the hotplug patchset for the 590.48.01 source

## [1:580.119.02-1] - 2025-12-16

### Changed
- Updated base to NVIDIA open kernel modules 580.119.02
- Refreshed Thunderbolt eGPU hotplug patchset for 580.119.02
- Avoided a potential deadlock while marking GPU as lost during surprise removal

## [1:580.105.08-19] - 2025-12-12

### Fixed
- Prevented module unload crashes by invalidating NVKMS device references before freeing device state
- Improved reconnect and surprise-removal cleanup, including safe GPU semaphore handling

### Added
- Added forced external-GPU mode for Thunderbolt 4/5 enclosures and Linux 6.18 compatibility
- Added udev hotplug rules and an improved systemd-run unload helper

## [1:580.105.08-1] - 2025-12-11

### Added
- Initial AUR package for nvidia-open-thunderbolt
- Thunderbolt eGPU hotplug support patches
- GPU lost detection for external GPUs
- Surprise removal handling
- Stale device cleanup for reconnection
- Quieter logging for expected removal

### Based On
- NVIDIA open-gpu-kernel-modules 580.105.08
- Original patches from Arch Linux package by Daniel Bermond

### Fixes
- No more kernel crashes on Thunderbolt eGPU hot-unplug
- Proper cleanup on GPU removal
- Safe removal support (nvoff script)
- Reconnection support after hot-unplug
