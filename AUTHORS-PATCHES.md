# Source and patch attribution

This is an independently packaged build of [SyscallBrain/virsh-tui](https://github.com/SyscallBrain/virsh-tui) with preserved changes from the former `lemon-sh/virsh-tui` fork. The packaging maintainer is not claiming authorship of the forwarded changes.

## Original changes

All 24 original commits are authored and committed by:

```text
lemonsh <lemon@lemonsh.moe>
```

Preserved source checkpoints:

- Upstream base: `639d31d979bf32ea2a30de0163f89442f850bf32`.
- Fork dev: `8e8626f7344daee2c432941d9e1a477e4b91a7a0`, 23 commits after the base.
- Optional pane-layout: `225c9a0d93041e5580ac5ed598f8e369badbf96b`, one further commit.

`0001-*.patch` through `0024-*.patch` were exported directly from those saved Git commits using `git format-patch --full-index --binary --no-signature`. Their original From/Author, author dates, subjects and commit messages are retained. They have not been rewritten as commits by the packaging maintainer.

For AUR transport, patch 0016 is stored as three UTF-8 text files ending in `.patch.part01`, `.patch.part02` and `.patch.part03`, each below 500000 bytes. `prepare()` concatenates them in order and verifies the SHA-256 of the original complete mail patch before application. This byte-preserving split changes no author metadata or diff. Reassemble these parts before using the original 24-patch series with `git am`.
Patches 0001 through 0023 reconstruct the saved dev source tree. Patch 0024 adds pane/separator layout and is enabled by default. Commenting its entry in `_pane_layout` disables only its application; the original patch remains included as a source file with its checksum.

The package version identifies the reconstructed historical fork checkpoint, not the current Git HEAD of the patched upstream checkout. Applying patches during packaging does not fabricate new Git author/committer metadata.

## Local test-restoration maintenance

`restore-tests.patch` is separate from the 24 original forwarded commits. It was prepared during this packaging work to restore 43 previously existing unit tests and their required fixtures after the fork removed its tests.

Historical blame attributes 36 restored test declarations to SyscallBrain and seven to lemonsh. The 13 restored fixtures match blobs from the upstream base. This is provenance from saved Git history, not a claim that the packaging maintainer authored those tests.

Most of the restored test code was already present in upstream/fork history. This work does not claim that code as newly authored tests. One expectation was adapted to the fork's intentional OS autodetection behavior. That local restoration/adaptation must not be attributed to lemonsh as an original forwarded commit.

The complete pre-deletion Git history is preserved separately in `lemon-recovery/virsh-tui-lemon.bundle`, including the historical test code and original commit identities. That recovery bundle is not a required package source and is not intended for upload to AUR.

## License

The project's original MIT LICENSE remains unchanged and is installed with the package. This attribution document supplements, and does not replace, that license or the original copyright notices.

An AUR packaging commit and a package's Packager field identify the person maintaining/building the package, not the original author of the enclosed source changes.
