# Changelog
## [1:595.58.03-1] - 2026-03-27

### Changed
- Updated base to NVIDIA open kernel modules 595.58.03
- Refreshed Thunderbolt eGPU hotplug patchset for 595.58.03 to be compatible

## [1:580.119.02-1] - 2025-12-16

### Changed
- Updated base to NVIDIA open kernel modules 580.119.02
- Refreshed Thunderbolt eGPU hotplug patchset for 580.119.02
- Avoided a potential deadlock while marking GPU as lost during surprise removal

## [1-1] - 2024-12-11

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
