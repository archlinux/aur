## v0.0.12 (2023-05-13) - #onward

* Refine grammar to handle commands like `\curl`
* Add new warning `RESERVED_TARGET` for use of non-special, reserved targets and prerequisites
* Sort warnings by line number (roughly), for easier navigation


## v0.0.11 (2023-05-04) - #enrichment

* Allow escaped newlines in more places, according to POSIX specifications. For example, make users may want to use multiline rule prerequisite lists, when managing long `.PHONY` or `.IGNORE` sequences.
* References to "policy" have been simplified to "check" for scanning operations and "message" for reported descriptions.
* Additional linter checks implemented.
* Existing checks refined. For example, `UB_LATE_POSIX_MARKER` now triggers when `*.include.mk` files feature the `.POSIX:` strict special target.
* Minor consistency improvement to the rendered warning message format.
* Add further illustrative examples, clarification, and minor grammatical enhancements to documentation.
* Refactor code layout for maintainability.


## v0.0.10 (2023-05-03) - #docs-and-ports

* Fix crate / API link integration.
* Attach pre-compiled binary ports for many platforms.


## v0.0.9 (2023-05-03) - #lint-ahoy

Many bugfixes and enhancements in this release.

* Refine makefile grammar for robustness.
* Include lines now take precedence over macros. This assists when linting for `UB_AMBIGUOUS_INCLUDE`.
* Fix inspect control flow for various kinds of files.
* Fix how machine generated makefiles are detected and skipped for linting.
* Detect gyp projects.
* Refine error handling and error message formatting.
* Preserve path casing in `inspect::Metadata` reports.
* Add new attributes to `inspect::Metadata` reports.
* Reduce some internal boilerplate in the unit test code.
* Add more tests.
* Refine documentation.
* Implemente our first set of standard makefile linter warnings.

Linter warning topics range from Undefined Behavior (UB) to hazards of global empty `.INCLUDE` declarations, to wasteful No-OPerations (NOP's) to simplifying boilerplate, to basic `.PHONY` semantics, to proper use of `.POSIX` declarations, to minor makefile performance enhancements.

Skipping pre-compiled ports out of expediency. An upcoming hotfix will soon generate fresh ports.


## v0.0.8 (2023-04-29) - #recursion

* unmake now accepts a list of multiple file and/or directory paths.
* unmake now recurses over directories.
* `.git`, `node_modules`, and `vendor` are skipped.
* Machine-generated makefiles are skipped.
* Symlinks are skipped.
* Implementation-specific filenames like `GNUmakefile` and `BSDmakefile` are skipped.
* `-d` / `--debug` shows skipped file paths
* `-i` / `--inspect` provides high level details about potential makefile paths
* Error messages about accessing files now name the offending file path
* Added more unit tests
* Minor performance enhancement when generating parse error messages

See #recursion


## v0.0.7 (2023-04-27) - #messaging

* Substantially clarify parse error messages
* Improve documentation
* Expand tests


## v0.0.6 (2023-04-26) - #special-delivery

Apply stricter parsing for special targets.

For example, prohibit the degenerate reset form `.POSIX:;`.

This reduces ambiguity / portability issues.


## v0.0.5 (2023-04-26) - #quintus

Major enhancements:

* Target more modern POSIX Issue 8, Draft 3 make spec
* Parse grammar substantially refined, for POSIX makefile syntax both new (`!=`) and old (`.PHONY`).
* Reject more syntactical forms with undefined behavior, such as `:=`
* Document illustrative examples for passing and failing makefile syntax
* Test suite substantially improved

Notable validation behaviors:

* Multiline instructions appearing in fringe places, may be treated as parse errors. This keeps the grammar simple, and encourages more readable makefiles. Annotating AST nodes with locations of questionable escape newline sequences, would have greatly complicated both the parser grammar and post-parsing linter logic.
* Late `.POSIX:` declarations are currently not checked. In the interest of expediency, we decided it was better to fix a larger issue with past releases, which incidentally prohibited use of the `.POSIX:` rule *anywhere* in the makefile.
* Some syntactical forms like `-include` are currently tolerated, though may be slated for rejection later. Either at parse or linter message level. 

Each release of `unmake` aims to provide meaningful, iterative improvements. While also balancing strictness on the one hand, with flexibility on the other. Now that the AST is beginning to cure, we plan subsequent releases to roll out higher level warnings.


## v0.0.4 (2023-04-14) - #rick-AST-ly

* Clarify unmake's intention to target specifically the (upcoming) 2008 POSIX release, as opposed to older POSIX standards
* Clarify more caveats in unmake capabilities and proper makefile authorship generally
* Allow upcoming POSIX 2008 assignment operators `:=`, `?=`, and `+=`. Ensure `:=` is treated as a macro declaration, rather than a rule declaration.
* Reject rules that have exactly zero prerequisites, zero inline commands, and zero indented commands, as make processing for such rules is undefined behavior.
* Fix dev environment provisioning script for unmake itself, in the event that some cargo packages are already installed
* Accelerate line counting update algorithm
* Add unit tests for more standard POSIX make elements


## v0.0.3 (2023-04-10) - #performance

* Optimize memory usage of line counting algorithm
* Improve CLI validation
* CR and CRLF now treated as parse errors
* Enrich AST with line numbers, in preparation for rendering linter warnings


## v0.0.2 (2023-04-09) - #roc

* Refined the grammar to more closely match the POSIX spec.
* Drop explicit `-n` / `--dry-run` flags. The parsing check is now the default behavior.
* Add more example scripts
* Add more unit tests


## v0.0.1 (2023-04-08) - #draft

Early prototype of a strict POSIX makefile AST. Results may vary.

Release archive includes ports for a wide variety of platforms.
