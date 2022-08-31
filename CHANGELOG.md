# [5.1.0](https://github.com/filipdutescu/renamer.nvim/compare/v5.0.0...v5.1.0) (2022-08-29)


### Features

* **health:** add more checks and logs ([2343e90](https://github.com/filipdutescu/renamer.nvim/commit/2343e901541d667380f69741833ffa00aff14564)), closes [#128](https://github.com/filipdutescu/renamer.nvim/issues/128) [#127](https://github.com/filipdutescu/renamer.nvim/issues/127)



# [5.0.0](https://github.com/filipdutescu/renamer.nvim/compare/v4.0.1...v5.0.0) (2022-05-19)


### Bug Fixes

* **submit:** trim new word before using (GH-123) ([7a2c0a1](https://github.com/filipdutescu/renamer.nvim/commit/7a2c0a1fd47d3dc94cc77db27b94a586ccc007a1)), closes [#123](https://github.com/filipdutescu/renamer.nvim/issues/123) [#119](https://github.com/filipdutescu/renamer.nvim/issues/119)


### Features

* **handler:** migrate to handler (GH-122) ([6c99bd9](https://github.com/filipdutescu/renamer.nvim/commit/6c99bd95dc7bf964f755f28ab4df83fd71fcdcbd)), closes [#122](https://github.com/filipdutescu/renamer.nvim/issues/122) [#117](https://github.com/filipdutescu/renamer.nvim/issues/117) [#121](https://github.com/filipdutescu/renamer.nvim/issues/121)


### BREAKING CHANGES

* **handler:** Migrate the LSP buffer request from manual to using
`vim.lsp.buf.rename(...)` to make the request and a custom LSP response
handler to manage the custom response processing (eg setting the qf
list) and the original Neovim rename handler to apply the requested
changes.

This implies removing several existing function, doing some cleanup of
tests and updating the documentation.



## [4.0.1](https://github.com/filipdutescu/renamer.nvim/compare/v4.0.0...v4.0.1) (2022-01-15)


### Bug Fixes

* popup having `sidescrolloff` if set ([917e17d](https://github.com/filipdutescu/renamer.nvim/commit/917e17d036a68b6595e3afd209945f94607d3f9f)), closes [#101](https://github.com/filipdutescu/renamer.nvim/issues/101)
* popup not showing if renamed word appears twice ([d02d6e9](https://github.com/filipdutescu/renamer.nvim/commit/d02d6e94e968c3b0860f6b26d903147e6dd54c40)), closes [#113](https://github.com/filipdutescu/renamer.nvim/issues/113)



# [4.0.0](https://github.com/filipdutescu/renamer.nvim/compare/v3.0.3...v4.0.0) (2022-01-03)


### Bug Fixes

* **layout:** popup position when low number of lines ([0bb3b67](https://github.com/filipdutescu/renamer.nvim/commit/0bb3b67c24fa928c4e93c14b94878599e3a29518)), closes [#105](https://github.com/filipdutescu/renamer.nvim/issues/105)
* names of min and max width parameters ([d6b6aef](https://github.com/filipdutescu/renamer.nvim/commit/d6b6aefb3a3f57750671ac077f546e0d230e4974))
* **readme:** width parameter names were incorrect ([3af5113](https://github.com/filipdutescu/renamer.nvim/commit/3af51139e954b948e345974dba4f5c5360970b46))
* **rename:** responses without `changes` break `qflist` ([842b499](https://github.com/filipdutescu/renamer.nvim/commit/842b4992ecc0a566d9fcc561832d580b1d364d8c)), closes [#106](https://github.com/filipdutescu/renamer.nvim/issues/106)
* renaming leading to file rename ([814ddbb](https://github.com/filipdutescu/renamer.nvim/commit/814ddbb11602e3c8b2af166b4d1e029272ab796f)), closes [#100](https://github.com/filipdutescu/renamer.nvim/issues/100)


### Features

* add customizable min and max width ([e9d8653](https://github.com/filipdutescu/renamer.nvim/commit/e9d86536da51559974d1876ebb3b46fd096a70b3)), closes [#101](https://github.com/filipdutescu/renamer.nvim/issues/101)


### BREAKING CHANGES

* Rename `minwidth` and `maxwidth` to the naming
convention used throughout the rest of the code (snake case). The two
will now be used as `min_width` and `max_width`.

Signed-off-by: Filip Dutescu <filip.dutescu@gmail.com>



## [3.0.3](https://github.com/filipdutescu/renamer.nvim/compare/v3.0.2...v3.0.3) (2021-11-29)


### Bug Fixes

* popup showing when no LSP client attached ([1b98bae](https://github.com/filipdutescu/renamer.nvim/commit/1b98baedb0c37c196158842eb0acf70da1913f6a)), closes [#96](https://github.com/filipdutescu/renamer.nvim/issues/96)
* various errors and logs ([dd25890](https://github.com/filipdutescu/renamer.nvim/commit/dd25890dde7922c34207b9dfd7fc9f737ff1c3ee)), closes [#95](https://github.com/filipdutescu/renamer.nvim/issues/95)



## [3.0.2](https://github.com/filipdutescu/renamer.nvim/compare/v3.0.1...v3.0.2) (2021-11-23)


### Bug Fixes

* responses with `documentChanges` set qflist properly ([#90](https://github.com/filipdutescu/renamer.nvim/issues/90)) ([645e7bd](https://github.com/filipdutescu/renamer.nvim/commit/645e7bd7a18f017f05f1f5ccf54331a510c93652))



## [3.0.1](https://github.com/filipdutescu/renamer.nvim/compare/v3.0.0...v3.0.1) (2021-11-20)


### Bug Fixes

* **rename:** handle `documentChanges` LSP response ([9341d33](https://github.com/filipdutescu/renamer.nvim/commit/9341d338dd025029a904ad32784f6bd31f37d2c8)), closes [#84](https://github.com/filipdutescu/renamer.nvim/issues/84)



# [3.0.0](https://github.com/filipdutescu/renamer.nvim/compare/v2.0.0...v3.0.0) (2021-11-18)


* feat!: add custom handler for successful renames ([09030b3](https://github.com/filipdutescu/renamer.nvim/commit/09030b3286b794ccf86251604e331d5fe66ad3e8)), closes [#84](https://github.com/filipdutescu/renamer.nvim/issues/84)


### BREAKING CHANGES

* Add a new field, `handler`, representing a function
to be called after successful renames, with the LSP
`textDocument/rename` raw response.



# [2.0.0](https://github.com/filipdutescu/renamer.nvim/compare/v1.0.0...v2.0.0) (2021-11-13)


### Bug Fixes

* **qflist:** first line in file was not set correctly ([2f9e66b](https://github.com/filipdutescu/renamer.nvim/commit/2f9e66b12cc115c3c8ad3aac360fb94d76f60bce)), closes [#79](https://github.com/filipdutescu/renamer.nvim/issues/79)
* **rename:** cursor placement at word end ([37c27fa](https://github.com/filipdutescu/renamer.nvim/commit/37c27fa77571ba9a81d06e148500fad9638bbe42)), closes [#73](https://github.com/filipdutescu/renamer.nvim/issues/73)


* fix(rename)!: cursor is not placed at the end of the initial word ([a20b471](https://github.com/filipdutescu/renamer.nvim/commit/a20b471c9be59445ddd21d16885a567790dca147)), closes [#73](https://github.com/filipdutescu/renamer.nvim/issues/73)
* feat(rename)!: add option for empty popup ([8f3d886](https://github.com/filipdutescu/renamer.nvim/commit/8f3d8864f22d118f4be886ed1c5fa94ec484784d)), closes [#71](https://github.com/filipdutescu/renamer.nvim/issues/71)
* feat!: add `with_popup` to enable/disable popup ([4ef89d5](https://github.com/filipdutescu/renamer.nvim/commit/4ef89d5057b5d89a7701bd1272dccd2aaabe912c)), closes [#68](https://github.com/filipdutescu/renamer.nvim/issues/68)
* feat(quickfix-list)!: add changes to qf list ([c88a70a](https://github.com/filipdutescu/renamer.nvim/commit/c88a70a917d99dbb49d6cf57477bfe469ea7067c)), closes [#69](https://github.com/filipdutescu/renamer.nvim/issues/69)


### BREAKING CHANGES

* Set the cursor to the end of the word inside the popup,
taking into account padding, as oposed to placing it at the start of the
popup.
* Add options to `rename()` to allow for the
popup to be empty or contain the initial word.
* Fallback when popup is disabled/not able to be drawn
changed from `vim.lsp.buf.rename()` to using `vim.fn.input()` to ask the
user for input. This is required for:

- setting the quickfix list with the resulting changes
- preserving non-GUI input alternative, since Neovim 0.5.2+ will have
  its own interface for `vim.lsp.buf.rename()`
* Add rename changes to the quickfix list, conditioned
by a new setup parameter. Update docs to describe the new parameter.



# [1.0.0](https://github.com/filipdutescu/renamer.nvim/compare/v0.3.0...v1.0.0) (2021-11-08)


### Bug Fixes

* removed renaming as empty string ([b20cc39](https://github.com/filipdutescu/renamer.nvim/commit/b20cc399b8ea24011bf78f17477432d1500df9b0)), closes [#57](https://github.com/filipdutescu/renamer.nvim/issues/57)


* fix(padding)!: validate padding before drawing popup ([da75d77](https://github.com/filipdutescu/renamer.nvim/commit/da75d77397498b2fe8ea0206aec2486ed8325fbf)), closes [#62](https://github.com/filipdutescu/renamer.nvim/issues/62)
* fix!: fallback to LSP rename if popup cannot be drawn ([0f8fd8f](https://github.com/filipdutescu/renamer.nvim/commit/0f8fd8f9315d18a3637fe1c95bfd8cc315e9bb6e)), closes [#12](https://github.com/filipdutescu/renamer.nvim/issues/12)
* fix!: width adjusts to content and window ([956989a](https://github.com/filipdutescu/renamer.nvim/commit/956989a103f7e5441476ee00c02cfaac0432aaba)), closes [#6](https://github.com/filipdutescu/renamer.nvim/issues/6)
* fix!: popup draws correctly on screen edges ([6b87076](https://github.com/filipdutescu/renamer.nvim/commit/6b8707689a67d63fedaa1b0bac4ae1ef6e92d5ae)), closes [#5](https://github.com/filipdutescu/renamer.nvim/issues/5)


### BREAKING CHANGES

* Validate padding alongside the window width and
height, before drawing popup.
* Validate if the window height and width allow for the
popup to be drawn, otherwise fallback to `vim.lsp.buf.rename()` and log
an error.
* Partially hide the title if the width would be to large
for the current window. Add minimum and maximum width and minimum
height. Refactor the creation of popup options.
* If the `cword` has a length greater than the `width`,
set `width` to that of the `cword`. Add default width of 0, if `title`
is not set.



# [0.3.0](https://github.com/filipdutescu/renamer.nvim/compare/v0.2.1...v0.3.0) (2021-11-06)


### Bug Fixes

* **highlight:** remove prefix highlight ([2f77f7e](https://github.com/filipdutescu/renamer.nvim/commit/2f77f7e7e52b2b9f54b145f15d32bc934bb00117))
* placement when border is disabled ([fdcafb9](https://github.com/filipdutescu/renamer.nvim/commit/fdcafb93276c1638b43287cf76d72e520ddf8744)), closes [#42](https://github.com/filipdutescu/renamer.nvim/issues/42)
* position when word appears multiple times ([d31cc3c](https://github.com/filipdutescu/renamer.nvim/commit/d31cc3c5326d1ddde97c2f75c33ec4da713a2aff)), closes [#43](https://github.com/filipdutescu/renamer.nvim/issues/43)
* remove prefix and prompt mode ([52c336d](https://github.com/filipdutescu/renamer.nvim/commit/52c336d003c9b9dd1b1326a3f7199bf147270860)), closes [#52](https://github.com/filipdutescu/renamer.nvim/issues/52)


### Features

* **highlighting:** add popup title highlighting ([8dbaf3d](https://github.com/filipdutescu/renamer.nvim/commit/8dbaf3d225db2f42713b65a20a8ed0eebed2c08b)), closes [#45](https://github.com/filipdutescu/renamer.nvim/issues/45)
* **highlight:** make references highlighting optional ([000d585](https://github.com/filipdutescu/renamer.nvim/commit/000d585342e14031aa754d25ec1919cce0800f39)), closes [#40](https://github.com/filipdutescu/renamer.nvim/issues/40)



## [0.2.1](https://github.com/filipdutescu/renamer.nvim/compare/v0.2.0...v0.2.1) (2021-10-30)


### Bug Fixes

* cursor placement when finishing `rename()` ([cdcdb17](https://github.com/filipdutescu/renamer.nvim/commit/cdcdb1760822240d9a93cd0f08f10f39d190c7c4)), closes [#33](https://github.com/filipdutescu/renamer.nvim/issues/33) [#34](https://github.com/filipdutescu/renamer.nvim/issues/34)
* cursor position when cancelled from `insert` ([8a5e63f](https://github.com/filipdutescu/renamer.nvim/commit/8a5e63f68f47cb3cfac82fd57a36143b1881e8d3)), closes [#37](https://github.com/filipdutescu/renamer.nvim/issues/37)
* **keymaps:** `<c-c>` added an `i` after clear ([59f64e6](https://github.com/filipdutescu/renamer.nvim/commit/59f64e68d69986410d9d77eec76a1cf0aeadaff6)), closes [#30](https://github.com/filipdutescu/renamer.nvim/issues/30)
* **keymaps:** all keymaps put the user in insert mode ([f9bafe6](https://github.com/filipdutescu/renamer.nvim/commit/f9bafe66c00780c34a8d86e035525cb6cb77bb2a)), closes [#31](https://github.com/filipdutescu/renamer.nvim/issues/31)
* set Neovim mode to initial one ([cdb40c6](https://github.com/filipdutescu/renamer.nvim/commit/cdb40c61a3460a4bd879d6aa03e06b03083a653a))



# [0.2.0](https://github.com/filipdutescu/renamer.nvim/compare/v0.1.0...v0.2.0) (2021-10-25)


### Features

* **health:** add healthcheck ([d3de848](https://github.com/filipdutescu/renamer.nvim/commit/d3de84826aa4c8c2a39745e5976d71ebecea3f2b)), closes [#8](https://github.com/filipdutescu/renamer.nvim/issues/8)
* highlight the word to be renamed ([f6eff46](https://github.com/filipdutescu/renamer.nvim/commit/f6eff46fa1529a4323d0cc048744a0b5bd912f97)), closes [#28](https://github.com/filipdutescu/renamer.nvim/issues/28)
* **keymaps:** add mappings for easier navigation ([8d0b299](https://github.com/filipdutescu/renamer.nvim/commit/8d0b2991d8b78c1c6ce46b589be79b68cda37341)), closes [#3](https://github.com/filipdutescu/renamer.nvim/issues/3)



# [0.1.0](https://github.com/filipdutescu/renamer.nvim/compare/43853a17491d05aaf6b8f93ad9a838ef7fb523f0...v0.1.0) (2021-10-10)


### Bug Fixes

* border window not closing ([43853a1](https://github.com/filipdutescu/renamer.nvim/commit/43853a17491d05aaf6b8f93ad9a838ef7fb523f0))
* column alignment of popup ([abbb194](https://github.com/filipdutescu/renamer.nvim/commit/abbb194a89fbddea16acec1b90aa2fcfcb8c309d))
* window close; feat: window style ([a414a3d](https://github.com/filipdutescu/renamer.nvim/commit/a414a3db98eb472d877a05429737408462e43f3d))


### Features

* add on_submit to execute callback ([37f74d7](https://github.com/filipdutescu/renamer.nvim/commit/37f74d7f438f12e2d5451c6c2ddb41ec5c02e249))
* Rename on submit ([48b5a56](https://github.com/filipdutescu/renamer.nvim/commit/48b5a5600cff49bd40693a562b62c2c6a3ee41b5))



